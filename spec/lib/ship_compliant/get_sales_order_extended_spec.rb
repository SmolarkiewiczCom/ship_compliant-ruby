require "spec_helper"

module ShipCompliant
  describe GetSalesOrderExtended do

    before { savon.mock! }
    after { savon.unmock! }

    let(:message) do
      {
        'Request' => {
          'Security' => {
            'PartnerKey' => 'abc-123',
            'Username' => 'bob@example.com',
            'Password' => 'secret'
          },
          'SalesOrderKey' => 'SomeOrderId'
        }
      }
    end

    let(:success_response) { File.read('spec/fixtures/void_order_success.xml') }

    context "by_order_key" do
      it "queries the client" do
        savon.expects(:get_sales_order_extended)
          .with(message: message).returns(success_response)
        
        GetSalesOrderExtended.by_order_key('SomeOrderId')
      end

      it "returns GetSalesOrderExtendedResult" do
        ShipCompliant.client.stub(:call) { {} }
        result = GetSalesOrderExtended.by_order_key('order-id')
        result.should be_kind_of(GetSalesOrderExtendedResult)
      end
    end
  end
end
