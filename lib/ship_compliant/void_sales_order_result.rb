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

    # Returns boolean whether order was successfully voided.
    #
    #   puts "SUCCESS" if result.success?
    def success?
      data[:response_status] == "Success"
    end

    # Returns true if order failed to be voided.
    #
    #   puts "FAILED" if result.failure?
    def failure?
      !success?
    end

    # Gets the error message from the request.
    #
    # Returns +nil+ when empty.
    #
    #   puts "ERROR: #{result.error_message}" unless result.success?
    def error_message
      error_item(:message)
    end

    # Gets the error code from the request.
    #
    # Returns +0+ when empty.
    #
    #   puts "ERROR ##{result.error_code}" unless result.success?
    def error_code
      error_item(:code).to_i
    end

    # Gets the key that failed.
    #
    # Returns +nil+ when empty.
    #
    #   puts "OrderKey: #{result.error_key}" unless result.success?
    def error_key
      error_item(:key)
    end

    private

    def error_item(key)
      data[:errors][:error][key] unless success?
    end

  end
end
