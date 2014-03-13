module ShipCompliant
  class << self
    attr_accessor :ship_compliant_client
  end

  # Returns an instance of +Client+.
  def self.client
    self.ship_compliant_client ||= new_client_from_wsdl(configuration.wsdl)
  end

  # Replaces #client with custom WSDL
  #
  #   ShipCompliant.wsdl = 'https://ws-dev.shipcompliant.com/Services/1.2/ProductService.asmx?WSDL'
  def self.wsdl=(wsdl)
    self.ship_compliant_client = new_client_from_wsdl(wsdl)
  end

  private

  # Creates a new client from a WSDL url.
  def self.new_client_from_wsdl(wsdl)
    Client.new(wsdl: wsdl, log: configuration.log)
  end

  class Client < Savon::Client
    # "Backup" original #call from Savon::Client
    alias_method :savon_call, :call

    # Adds the required security credentials and formats
    # the message to match the ShipCompliant structure.
    #
    #   ShipCompliant.client.call(:some_operation, {
    #     'SomeKey' => 'SomeValue'
    #   })
    def call(operation, locals = {})
      locals['Security'] = ShipCompliant.configuration.credentials

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
