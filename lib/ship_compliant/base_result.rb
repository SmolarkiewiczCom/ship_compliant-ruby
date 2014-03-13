module ShipCompliant
  # == ShipCompliant::BaseResult
  #
  # This class provides methods to are relevant to every
  # API request. All requests made through the
  # ShipCompliant API client include these methods.
  module BaseResult

    # Returns boolean whether order was successfully voided.
    #
    #   puts "SUCCESS" if result.success?
    def success?
      response[:response_status] == "Success"
    end

    # Returns true if order failed to be voided.
    #
    #   puts "FAILED" if result.failure?
    def failure?
      !success?
    end

    # An array of +ErrorResult+ items or an empty array if the response was
    # successful.
    #
    #   result.errors.each do |error|
    #     puts "#{error.message} [#error.key]"
    #   end
    def errors
      return [] if success?
      @errors ||= Array.wrap(response[:errors][:error]).map do |error|
        ErrorResult.new(error)
      end
    end

    # The number of errors in the response.
    def errors_count
      errors.length
    end
    alias_method :error_count, :errors_count

  end
end
