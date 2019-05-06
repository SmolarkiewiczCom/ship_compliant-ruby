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
      
      it "returns a SearchSalesOrdersResult" do
        allow(SearchSalesOrders).to receive(:search_sales) { {} }

        result = SearchSalesOrders.find_by({})
        expect(result).to be_kind_of(SearchSalesOrdersResult)
      end
    end
  end
end
