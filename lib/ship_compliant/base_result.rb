module ShipCompliant
  module BaseResult

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
