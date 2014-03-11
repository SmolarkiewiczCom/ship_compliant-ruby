module ShipCompliant
  # === ShipCompliant::SearchSalesOrderSummary
  #
  # Wraps the +SalesOrderSummary+ hash with a simple DSL
  # to provide easy access to various keys.
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

    # Returns the parsed hash from the +ShipmentSummary+ element.
    #
    #   {
    #     compliance: 'ValueHere',
    #     requested_ship_date: DateTime,
    #     # etc...
    #   }
    def shipment_summary
      data[:shipments][:shipment_summary]
    end
  end
end
