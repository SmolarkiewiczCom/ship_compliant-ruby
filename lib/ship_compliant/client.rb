module ShipCompliant
  class << self
    attr_accessor :ship_compliant_client
  end

  # Returns an instance of +Client+.
  def self.client
    self.ship_compliant_client ||= Client.new(wsdl: 'https://ws-dev.shipcompliant.com/services/1.2/coreservice.asmx?WSDL', log: configuration.log)
  end

  class Client < Savon::Client
  end
end
