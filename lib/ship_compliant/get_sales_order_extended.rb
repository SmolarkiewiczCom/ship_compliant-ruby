module ShipCompliant
  class GetSalesOrderExtended

    def self.by_order_key(order_key)
      result = ShipCompliant.client.call(:get_sales_order_extended, {
        'SalesOrderKey' => order_key
      })

      GetSalesOrderExtendedResult.new(result)
    end

  end
end
