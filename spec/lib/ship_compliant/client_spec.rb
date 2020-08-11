require "spec_helper"

module ShipCompliant
  describe Client do

    it "inherits from Savon::Client" do
      expect(ShipCompliant.client).to be_kind_of(Savon::Client)
    end

    it "uses wsdl from configuration" do
      ShipCompliant.configure do |c|
        c.wsdl = 'http://example.com'
      end

      expect(ShipCompliant.client.globals[:wsdl]).to eq('http://example.com')
    end

    it "uses log value from configuration" do
      # configuration is defined in spec_helper.rb
      expect(ShipCompliant.client.globals[:log]).to be_falsey
    end

    it "don't share configuration between threads" do
      ShipCompliant.configure do |c|
        c.username = 'foo'
      end

      Thread.new do
        ShipCompliant.configure do |c|
          c.username = 'bar'
        end

        expect(ShipCompliant.configuration.username).to eq('bar')
      end.join

      expect(ShipCompliant.configuration.username).to eq('foo')
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
        allow(ShipCompliant.client).to receive(:savon_call) do
          double(to_hash: {
            a_method_response: {
              a_method_result: {
                response_status: 'Success'
              }
            }
          })
        end

        result = ShipCompliant.client.call(:a_method, {})
        expect(result).to eq({
          response_status: 'Success'
        })
      end
    end

    context "wsdl=" do
      it "changes the default wsdl" do
        ShipCompliant.configuration = nil
        expect(ShipCompliant.client.globals[:wsdl]).to eq('https://ws-dev.shipcompliant.com/services/1.2/coreservice.asmx?WSDL')
        ShipCompliant.wsdl = 'http://ws.example.com?WSDL'
        expect(ShipCompliant.client.globals[:wsdl]).to eq('http://ws.example.com?WSDL')
      end
    end

  end
end
