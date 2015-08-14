module ShipCompliant
  class << self
    attr_accessor :configuration, :secondary_configuration
  end

  def self.configure
    yield(configuration, secondary_configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.secondary_configuration
    @secondary_configuration ||= Configuration.new
  end

  # Stores runtime configuration to authenticate user.
  #
  #   ShipCompliant.configure do |c|
  #     c.partner_key = 'XXXX-XX-XXXXX'
  #     c.username = 'bob@example.com'
  #     c.password = 'secret'
  #     c.log = true # savon log
  #   end
  class Configuration
    attr_accessor :partner_key, :username, :password
    attr_accessor :wsdl, :log

    def initialize
      @log = true
      @wsdl = 'https://ws-dev.shipcompliant.com/services/1.2/coreservice.asmx?WSDL'
    end

    # Returns a +Hash+ for authenticating each API request.
    #
    #   {
    #     'PartnerKey' => 'XXXX-XX-XXXXX',
    #     'Username' => 'bob@example.com',
    #     'Password' => 'secret'
    #   }
    def credentials
      {
        'PartnerKey' => partner_key,
        'Username' => username,
        'Password' => password
      }
    end
  end
end
