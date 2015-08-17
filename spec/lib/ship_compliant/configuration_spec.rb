require "spec_helper"

module ShipCompliant
  describe Configuration do

    let(:secondary_username) { 'fdsafdsafdsafdsa' }

    before do
      ShipCompliant.configuration = nil
      ShipCompliant.configure do |c, c2|
        c.partner_key = 'abc-123'
        c.username = 'bob@example.com'
        c.password = 'secret'
        c2.username = secondary_username
      end
    end
    
    it "stores user credentials" do
      ShipCompliant.configuration.partner_key.should == 'abc-123'
      ShipCompliant.configuration.username.should == 'bob@example.com'
      ShipCompliant.configuration.password.should == 'secret'
    end

    it "stores secondary set of credentials" do
      expect(ShipCompliant.secondary_configuration.username)
        .to eq(secondary_username)
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
