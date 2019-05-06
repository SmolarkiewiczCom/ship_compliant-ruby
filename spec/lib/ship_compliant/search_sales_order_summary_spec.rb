require "spec_helper"

module ShipCompliant
  describe SearchSalesOrderSummary do
    let(:response) do
      {
        purchase_date: DateTime.new(2014, 1, 1),
        sales_order_key: 'ORD-1',
        shipments: {
          shipment_summary: {
            compliance: 'Perfect Score',
            requested_ship_date: '2014-01-03T14:30:00',
            ship_date: '2014-01-03T12:23:00',
            
            ship_to: {
              first_name: 'Bob',
              last_name: 'Smith',
              zip1: 80234
            }
          }
        }
      }
    end

    let(:summary) { SearchSalesOrderSummary.new(response) }

    context "purchase_date" do
      it "returns a DateTime from the purchase date" do
        expect(summary.purchase_date).to eq(DateTime.new(2014, 1, 1))
      end
    end

    context "order_key" do
      it "returns the order_key" do
        expect(summary.order_key).to eq('ORD-1')
        expect(summary.sales_order_key).to eq('ORD-1')
      end
    end

    context "shipment_summary" do
      it "the parsed hash" do
        expect(summary.shipment_summary).to eq({
          compliance: 'Perfect Score',
          requested_ship_date: '2014-01-03T14:30:00',
          ship_date: '2014-01-03T12:23:00',
          
          ship_to: {
            first_name: 'Bob',
            last_name: 'Smith',
            zip1: 80234
          }
        })
      end
    end
  end
end
