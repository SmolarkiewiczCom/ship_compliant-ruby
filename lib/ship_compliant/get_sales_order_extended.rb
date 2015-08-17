module ShipCompliant
  # == ShipCompliant::GetSalesOrderExtended
  # 
  # This method takes in a Sales Order Key and returns detailed data about the
  # sales order, including compliance status.
  #
  # Use this method to query the full details of a sales order and the
  # shipments in the sales order.
  class GetSalesOrderExtended

    # Finds a +SalesOrder+ by the +SalesOrderKey+.
    #
    # Returns an instance of ShipCompliant::GetSalesOrderExtendedResult.
    def self.by_order_key(order_key, configuration: :default)
      result = ShipCompliant.client(configuration: configuration).call(:get_sales_order_extended, {
        'SalesOrderKey' => order_key
      })

      GetSalesOrderExtendedResult.new(result)
    end

  end
end
