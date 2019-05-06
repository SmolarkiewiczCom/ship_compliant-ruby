require "spec_helper"

module ShipCompliant
  describe CommitSalesOrder do

    before { savon.mock! }
    after { savon.unmock! }

    it "commits a sales order" do
      message = {
        'Request' => {
          'Security' => {
            'PartnerKey' => 'abc-123',
            'Username' => 'bob@example.com',
            'Password' => 'secret'
          },
          'CommitOptions' => 'AllShipments',
          'Payments' => nil,
          'SalesTaxCollected' => 0,
          'SalesOrderKey' => 'ORDER-KEY'
        }
      }

      savon.expects(:commit_sales_order)
        .with(message: message)
        .returns(File.read('spec/fixtures/void_order_success.xml'))
        
      result = ShipCompliant::CommitSalesOrder.call({
        commit_options: 'AllShipments',
        payments: nil,
        sales_tax_collected: 0,
        sales_order_key: 'ORDER-KEY'
      })

      expect(result).to be_kind_of(CommitSalesOrderResult)
    end
  end
end
