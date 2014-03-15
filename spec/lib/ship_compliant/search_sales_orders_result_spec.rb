require "spec_helper"

module ShipCompliant
  describe SearchSalesOrdersResult do

    let(:response) do
      {
        sales_orders: {
          sales_order_summary: {
            shipments: {}
          }
        }
      }
    end

    it_behaves_like "BaseResult"

    context "length" do
      it "returns the number of returned orders" do
        response[:count_sales_orders_returned] = '5'
        result = SearchSalesOrdersResult.new(response)

        result.length.should == 5
      end
    end

    context "remaining_orders_length" do
      it "returns the number of orders left" do
        response[:count_more_sales_orders_available] = '8'
        result = SearchSalesOrdersResult.new(response)

        result.remaining_orders_length.should == 8
      end
    end

    context "summaries" do
      it "returns an array of SearchSalesOrderSummary" do
        result = SearchSalesOrdersResult.new(response)
        result.summaries[0].should be_kind_of(SearchSalesOrderSummary)
      end

      it "returns empty array when blank" do
        result = SearchSalesOrdersResult.new({})
        result.summaries.should == []
      end
    end

    context "parse!" do
      it "adds missing sales_orders summaries" do
        result = SearchSalesOrdersResult.new({})
        result.raw.should == {
          sales_orders: {
            sales_order_summary: [{}]
          }
        }
      end

      it "converts single order summary to an array" do
        result = SearchSalesOrdersResult.new(response)

        result.raw.should == {
          sales_orders: {
            sales_order_summary: [
              shipments: {}
            ]
          }
        }
      end

      it "converts fields to integers" do
        response[:count_more_sales_orders_available] = '10'
        response[:count_sales_orders_returned] = '5'
        response[:sales_orders][:sales_order_summary][:shipments] = {
          shipment_summary: {
            shipment_key: '59',
            ship_to: {
              zip1: '12345'
            }
          }
        }

        result = SearchSalesOrdersResult.new(response)

        result.raw.should ==  {
          count_more_sales_orders_available: 10,
          count_sales_orders_returned: 5,

          sales_orders: {
            sales_order_summary: [
              {
                shipments: {
                  shipment_summary: {
                    shipment_key: 59,
                    ship_to: {
                      zip1: 12345
                    }
                  }
                }
              }
            ]
          }
        }
      end
    end
  end
end
