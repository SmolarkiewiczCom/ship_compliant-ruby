module ShipCompliant
  class SuggestedAddress < Address

    # Returns a Hash of the address location details.
    #
    # - +city_abbreviation+
    # - +congressional_district+
    # - +county_fips+
    # - +time_zone+
    # - +time_zone_code+
    def details
      address[:details]
    end

    # Returns a Hash of the address parts.
    #
    # - +company+
    # - +mail_box_name+
    # - +mail_box_number+
    # - +post_direction+
    # - +pre_direction+
    # - +street_name+
    # - +street_number+
    # - +street_suffix+
    # - +suite_name+
    # - +suite_number+
    def parts
      address[:parts]
    end

  end
end
