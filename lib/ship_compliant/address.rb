module ShipCompliant
  # == ShipCompliant::Address
  #
  # This is a value object that wraps an address node. +BillTo+ and +ShipTo+.
  #
  #   address = ShipCompliant::Address.new(city: 'Boston', state: 'MA')
  #   address.city #=> 'Boston'
  #   address.state #=> 'MA'
  class Address < Struct.new(:address)

    # Returns the suggested city.
    def city
      address[:city]
    end
    
    # Returns the suggested county.
    def county
      address[:county]
    end

    # Returns the suggested state.
    def state
      address[:state]
    end

    # Returns the suggested street.
    def street1
      address[:street1]
    end

    # Returns the suggested street line 2.
    def street2
      address[:street2]
    end

    # Returns the suggested zip code.
    def zip1
      address[:zip1].to_i
    end

    # Returns the suggested zip code extension.
    def zip2
      address[:zip2].to_i
    end

  end
end
