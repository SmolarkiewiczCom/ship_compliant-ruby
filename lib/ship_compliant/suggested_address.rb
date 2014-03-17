module ShipCompliant
  class SuggestedAddress < Struct.new(:address)

    def city
      address[:city]
    end
    
    def county
      address[:county]
    end

    def state
      address[:state]
    end

    def street1
      address[:street1]
    end

    def street2
      address[:street2]
    end

    def zip1
      address[:zip1].to_i
    end

    def zip2
      address[:zip2].to_i
    end

    def details
      address[:details]
    end

    def parts
      address[:parts]
    end

  end
end
