require "spec_helper"

module ShipCompliant
  describe SearchSalesOrders do

    before { savon.mock! }
    after { savon.unmock! }
    
    context "find_by" do
      
      let(:message) do
        {
          'Request' => {
            'Security' => {
              'PartnerKey' => 'abc-123',
              'Username' => 'bob@example.com',
              'Password' => 'secret'
            },
            'ComplianceStatus' => 45
          }
        }
      end
      let(:response) { File.read('spec/fixtures/search_sales_orders.xml') }

      it "queries the client" do
        savon.expects(:search_sales_orders)
          .with(message: message).returns(response)

        SearchSalesOrders.find_by({
          compliance_status: 45
        })
      end
    end
  end
end
