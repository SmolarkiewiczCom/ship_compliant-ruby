module ShipCompliant
  class CheckCompliance

    def self.of_sales_order(data)
      camel_cased_keys = data.deep_transform_keys { |key| key.to_s.classify }
      ShipCompliant.client.call(:check_compliance_of_sales_order_with_address_validation, camel_cased_keys)
    end

  end
end
