require "spec_helper"

module ShipCompliant
  describe Client do

    it "inherits from Savon::Client" do
      ShipCompliant.client.should be_kind_of(Savon::Client)
    end

    it "uses wsdl from configuration" do
      ShipCompliant.configure do |c|
        c.wsdl = 'http://example.com'
      end

      ShipCompliant.client.globals[:wsdl].should == 'http://example.com'
    end

    it "uses log value from configuration" do
      # configuration is defined in spec_helper.rb
      ShipCompliant.client.globals[:log].should == false
    end

    context "call" do
      before { savon.mock! }
      after { savon.unmock! }

      it "simplifies the actual api" do
        message = {
          'Request' =>  {
            'Security' => ShipCompliant.configuration.credentials,
            'InventoryType' => 'All',
            'FulfillmentLocation' => 'WineShipping'
          }
        }
        savon.expects(:get_inventory_details)
          .with(message: message)
          .returns('')

        ShipCompliant.client.call(:get_inventory_details, {
            'InventoryType' => 'All',
            'FulfillmentLocation' => 'WineShipping'
        })
      end
    end

    context "wsdl=" do
      it "changes the default wsdl" do
        ShipCompliant.client.globals[:wsdl].should == 'https://ws-dev.shipcompliant.com/services/1.2/coreservice.asmx?WSDL'
        ShipCompliant.wsdl = 'http://ws.example.com?WSDL'
        ShipCompliant.client.globals[:wsdl].should == 'http://ws.example.com?WSDL'
      end
    end

  end
end
