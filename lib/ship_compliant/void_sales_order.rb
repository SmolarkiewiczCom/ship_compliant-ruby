module ShipCompliant
  # == ShipCompliant::VoidSalesOrder
  #
  # This method takes in a sales order key and
  # voids all shipments in an existing sales order.
  # Voided shipments do not count towards volume limits or reporting.
  # 
  # Use this method if an order has been voided. You can also use this method to
  # void an order with committed shipments before entering a new order with the same order key.
  #
  #   result = ShipCompliant::VoidSalesOrder.by_order_key('OrderKey')
  #   
  #   if result.success?
  #     puts "Order Voided"
  #   else
  #     puts "Failed to void order"
  #     puts "[%d] %s" % [result.error_code, result.error_message]
  #   end
  class VoidSalesOrder

    # Takes an sales order key and makes a request to void
    # it in the system.
    #
    # Returns an instance of ShipCompliant::VoidSalesOrderResult
    #
    #   result = ShipCompliant::VoidSalesOrder.by_order_key('OrderKey')
    def self.by_order_key(order_key)
      result = void_order({ 'SalesOrderKey' => order_key })
      VoidSalesOrderResult.new(result)
    end

    private

    def self.void_order(request)
      ShipCompliant.client.call(:void_sales_order, request)
    end

  end
end
