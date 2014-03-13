require "spec_helper"

module ShipCompliant
  describe VoidSalesOrder do

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
        savon.expects(:void_sales_order)
          .with(message: message).returns(success_response)
        
        VoidSalesOrder.by_order_key('SomeOrderId')
      end

      it "returns a VoidSalesOrderResult" do
        VoidSalesOrder.stub(:void_order) { {} }
        
        result = VoidSalesOrder.by_order_key('SomeOrderId')
        result.should be_kind_of(VoidSalesOrderResult)
      end
    end

  end
end
