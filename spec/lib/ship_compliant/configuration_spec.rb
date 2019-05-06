require "spec_helper"

module ShipCompliant
  describe Configuration do

    let(:secondary_username) { 'fdsafdsafdsafdsa' }
    let(:secondary_password) { 'hello2' }
    let(:super_supplier_username) { 'hgffadsfasdfasd' }
    let(:super_supplier_password) { 'hello3' }

    before do
      ShipCompliant.configuration = nil
      ShipCompliant.configure do |c, c2, ssc|
        c.partner_key = 'abc-123'
        c.username = 'bob@example.com'
        c.password = 'secret'
        c2.username = secondary_username
        c2.password = secondary_password
        ssc.username = super_supplier_username
        ssc.password = super_supplier_password
      end
    end
    
    it "stores user credentials" do
      expect(ShipCompliant.configuration.partner_key).to eq('abc-123')
      expect(ShipCompliant.configuration.username).to eq('bob@example.com')
      expect(ShipCompliant.configuration.password).to eq('secret')
    end

    it "stores secondary set of credentials" do
      expect(ShipCompliant.secondary_configuration.username)
        .to eq(secondary_username)
      expect(ShipCompliant.secondary_configuration.password)
        .to eq(secondary_password)
    end

    it "stores creds set for super supplier of credentials" do
      expect(ShipCompliant.super_supplier_configuration.username)
        .to eq(super_supplier_username)
      expect(ShipCompliant.super_supplier_configuration.password)
        .to eq(super_supplier_password)
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
