module ShipCompliant
  class ErrorResult < Struct.new(:error)

    # Gets the error code as an integer.
    #
    #   puts "ERROR ##{error.code}" #=> 404
    def code
      error[:code].to_i
    end

    # Gets the key of the item with an error.
    #
    #   puts error.key #=> 'ORDER-123'
    def key
      error[:key]
    end

    # Gets the error message.
    #
    #   puts "ERROR: #{error.message}" #=> 'I don't think it's a good idea,
    #   Yogi'
    def message
      error[:message]
    end

    # The object type that had the error.
    #
    #   puts error.target #=> 'SalesOrder'
    def target
      error[:target]
    end

    # The type of error that occured.
    #
    #   puts error.type #=> 'Validation'
    def type
      error[:type]
    end

  end
end
