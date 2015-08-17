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

      ShipCompliant.client(configuration: :default).globals[:wsdl].should == 'http://example.com'
    end

    it "uses log value from configuration" do
      # configuration is defined in spec_helper.rb
      ShipCompliant.client(configuration: :default).globals[:log].should == false
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
        savon.expects(:search_sales_orders)
          .with(message: message)
          .returns(File.read('spec/fixtures/search_sales_orders.xml'))

        ShipCompliant.client.call(:search_sales_orders, {
            'InventoryType' => 'All',
            'FulfillmentLocation' => 'WineShipping'
        })
      end

      it "the response's result directly" do
        ShipCompliant.client.stub(:savon_call) do
          stub(to_hash: {
            a_method_response: {
              a_method_result: {
                response_status: 'Success'
              }
            }
          })
        end

        result = ShipCompliant.client.call(:a_method, {})
        result.should == {
          response_status: 'Success'
        }
      end
    end

    context "wsdl=" do
      it "changes the default wsdl" do
        ShipCompliant.configuration = nil
        ShipCompliant.client.globals[:wsdl].should == 'https://ws-dev.shipcompliant.com/services/1.2/coreservice.asmx?WSDL'
        ShipCompliant.set_wsdl('http://ws.example.com?WSDL', configuration: :default)
        ShipCompliant.client.globals[:wsdl].should == 'http://ws.example.com?WSDL'
      end
    end

  end
end
