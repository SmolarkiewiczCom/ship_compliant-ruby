require "spec_helper"

module ShipCompliant
  describe Configuration do

    before do
      ShipCompliant.configuration = nil
      ShipCompliant.configure do |c|
        c.partner_key = 'abc-123'
        c.username = 'bob@example.com'
        c.password = 'secret'
      end
    end
    
    it "stores user credentials" do
      expect(ShipCompliant.configuration.partner_key).to eq('abc-123')
      expect(ShipCompliant.configuration.username).to eq('bob@example.com')
      expect(ShipCompliant.configuration.password).to eq('secret')
    end

    it "creates authentication hash" do
      expect(ShipCompliant.configuration.credentials).to eq({
        'PartnerKey' => 'abc-123',
        'Username' => 'bob@example.com',
        'Password' => 'secret'
      })
    end

    it "defaults log to true" do
      expect(ShipCompliant.configuration.log).to be_truthy
    end

    context "wsdl" do
      it "defaults to core services" do
        expect(ShipCompliant.configuration.wsdl).to eq('https://ws-dev.shipcompliant.com/services/1.2/coreservice.asmx?WSDL')
      end

      it "can be changed" do
        ShipCompliant.configure do |c|
          c.wsdl = 'http://example.com'
        end
        expect(ShipCompliant.configuration.wsdl).to eq('http://example.com')
      end
    end

  end
end
