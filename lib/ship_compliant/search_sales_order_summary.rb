# === ShipCompliant::SearchSalesOrderSummary
#
# Wraps the +SalesOrderSummary+ hash with a simple DSL
# to parse strings into usable data.
#
#   summary = ShipCompliant::SearchSalesOrderSummary({
#     purchase_date: '2014-01-01T08:55:00'
#   })
#
#   summary.purchase_date == DateTime.new(2014, 1, 1, 8, 55) #=> true
module ShipCompliant
  class SearchSalesOrderSummary < Struct.new(:data)

    # Returns a +DateTime+ from the order +purchase_date+
    def purchase_date
      data[:purchase_date]
    end

    # Returns the +sales_order_key+
    def order_key
      data[:sales_order_key]
    end
    alias_method :sales_order_key, :order_key

    def shipment_summary
      data[:shipments][:shipment_summary]
    end
  end
end
