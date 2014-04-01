require "spec_helper"

module ShipCompliant
  describe SearchMoreSalesOrders do

    before { savon.mock! }
    after { savon.unmock! }

    let(:message) do
      {
        'Request' =>  {
          'Security' => ShipCompliant.configuration.credentials,
          'PagingCookie' => 'paging-cookie'
        }
      }
    end

    context "paging_cookie" do
      it "finds orders by paging cookie" do
        savon.expects(:search_more_sales_orders)
          .with(message: message)
          .returns(File.read('spec/fixtures/search_sales_orders.xml'))

        SearchMoreSalesOrders.paging_cookie('paging-cookie')
      end
    end

  end
end
