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
      ShipCompliant.configuration.partner_key.should == 'abc-123'
      ShipCompliant.configuration.username.should == 'bob@example.com'
      ShipCompliant.configuration.password.should == 'secret'
    end

    it "creates authentication hash" do
      ShipCompliant.configuration.credentials.should == {
        'PartnerKey' => 'abc-123',
        'Username' => 'bob@example.com',
        'Password' => 'secret'
      }
    end

    it "defaults log to true" do
      ShipCompliant.configuration.log.should == true
    end

    context "wsdl" do
      it "defaults to core services" do
        ShipCompliant.configuration.wsdl.should == 'https://ws-dev.shipcompliant.com/services/1.2/coreservice.asmx?WSDL'
      end

      it "can be changed" do
        ShipCompliant.configure do |c|
          c.wsdl = 'http://example.com'
        end
        ShipCompliant.configuration.wsdl.should == 'http://example.com'
      end
    end

  end
end
