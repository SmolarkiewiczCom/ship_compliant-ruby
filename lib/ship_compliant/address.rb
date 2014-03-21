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

    # Returns the country.
    def country
      address[:country]
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
      return nil if address[:zip2].blank?
      address[:zip2].to_i
    end

    # Returns the company.
    def company
      address[:company]
    end

    # Returns the first name.
    def first_name
      address[:first_name]
    end

    # Returns the last name.
    def last_name
      address[:last_name]
    end

    # Returns the phone.
    def phone
      address[:phone]
    end

    # Returns the fax.
    def fax
      address[:fax]
    end

    # Returns the email address.
    def email
      address[:email]
    end

    # Returns the date of birth.
    def date_of_birth
      address[:date_of_birth]
    end
  end
end
