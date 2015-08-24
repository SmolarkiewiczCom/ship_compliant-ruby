module ShipCompliant
  class << self
    attr_accessor :ship_compliant_client
  end

  # Returns an instance of +Client+.
  def self.client(configuration: :default)
    config = get_config_object_for_key(configuration)
    self.ship_compliant_client ||= new_client_from_wsdl(config.wsdl,
      configuration: config)
  end

  # Replaces #client with custom WSDL
  #
  #   ShipCompliant.wsdl = 'https://ws-dev.shipcompliant.com/Services/1.2/ProductService.asmx?WSDL'
  def self.set_wsdl(wsdl, configuration:)
    self.ship_compliant_client = new_client_from_wsdl(wsdl,
      configuration: get_config_object_for_key(configuration))
  end

  def self.get_config_object_for_key(config_key)
    {
      default: ShipCompliant.configuration,
      secondary: ShipCompliant.secondary_configuration
    }[config_key]
  end

  private

  # Creates a new client from a WSDL url.
  def self.new_client_from_wsdl(wsdl, configuration:)
    client = Client.new(wsdl: wsdl, log: configuration.log,
      filters: %W[PartnerKey Username Password])
    client.configuration = configuration
    client
  end

  class Client < Savon::Client
    attr_accessor :configuration

    # "Backup" original #call from Savon::Client
    alias_method :savon_call, :call

    # Adds the required security credentials and formats
    # the message to match the ShipCompliant structure.
    #
    #   ShipCompliant.client(configuration: configuration).call(:some_operation, {
    #     'SomeKey' => 'SomeValue'
    #   })
    def call(operation, locals = {})
      locals['Security'] = configuration.credentials

      response = savon_call(operation, message: {
        'Request' => locals
      })

      get_result_from_response(operation, response)
    end

    private

    def get_result_from_response(operation, response)
      key = operation.to_s
      resp_key = (key + '_response').to_sym
      result_key = (key + '_result').to_sym
      response.to_hash.fetch(resp_key, {}).fetch(result_key, {})
    end
  end
end
