module ShipCompliant
  # == ShipCompliant::VoidSalesOrderResult
  #
  # This class provides methods to easily get the result
  # of voiding a sales order. You can quickly check if
  # voiding the order was a success or not. As well as
  # get the error message.
  #
  #   result = ShipCompliant::VoidSalesOrder.by_order_key('OrderKey')
  #   
  #   if result.success?
  #     puts "Order Voided"
  #   else
  #     puts "Failed to void order"
  #     puts "[%d] %s" % [result.error_code, result.error_message]
  #   end
  class VoidSalesOrderResult < Struct.new(:data)
    # include BaseResult
  end
end
