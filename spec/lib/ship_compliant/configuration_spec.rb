require "spec_helper"

module ShipCompliant
  describe Configuration do
    
    it "stores user credentials" do
      ShipCompliant.configure do |c|
        c.partner_key = 'abc-123'
        c.username = 'bob@example.com'
        c.password = 'secret'
      end

      ShipCompliant.configuration.partner_key.should == 'abc-123'
      ShipCompliant.configuration.username.should == 'bob@example.com'
      ShipCompliant.configuration.password.should == 'secret'
    end

    it "creates authentication hash" do
      ShipCompliant.configure do |c|
        c.partner_key = 'abc-123'
        c.username = 'bob@example.com'
        c.password = 'secret'
      end

      ShipCompliant.configuration.credentials.should == {
        'PartnerKey' => 'abc-123',
        'Username' => 'bob@example.com',
        'Password' => 'secret'
      }
    end

  end
end
