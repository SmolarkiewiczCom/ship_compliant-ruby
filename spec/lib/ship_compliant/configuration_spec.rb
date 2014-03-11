require "spec_helper"

module ShipCompliant
  describe Configuration, skip_config: true do

    before do
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

  end
end
