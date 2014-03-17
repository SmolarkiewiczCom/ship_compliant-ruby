module ShipCompliant
  # == ShipCompliant::CheckCompliance
  #
  # The CheckComplianceOfSalesOrderWithAddressValidation API method is used for
  # real time compliance checks from the order point of entry (eCommerce, POS).  
  #
  # The method can do three things in one call:
  #
  # - Calculate Sales Tax Due for order and return product level tax rates
  #   (IncludeSalesTaxRates = true)
  # - Validate the ShipTo address and get normalized address result
  # - Check compliance of the order
  #  
  # This method takes requires specific order information from the order point
  # of entry for ShipCompliant to check the order for compliance.  The sales
  # order will not be committed via this method.  This API call is usually
  # paired with CommitSalesOrder() to save the sales order to ShipCompliant.
  #
  # Look at the following example request: http://git.io/xMNOvw
  class CheckCompliance

    # Checks the compliance of a sales order from the data specified.
    #
    # An example of all the required fields can be seen here: http://git.io/xMNOvw
    #
    #   ShipCompliant::CheckCompliance.of_sales_order({
    #     address_option: {
    #       ignore_street_level_errors: true,
    #       reject_if_address_suggested: 'false' # Savon bug? Passes the value as an attribute when a boolean
    #     },
    #     include_sales_tax_rates: true,
    #     # ...
    #   })
    def self.of_sales_order(data)
      camel_cased_keys = data.deep_transform_keys { |key| key.to_s.classify }
      result = ShipCompliant.client.call(:check_compliance_of_sales_order_with_address_validation, camel_cased_keys)
      CheckComplianceResult.new(result)
    end

  end
end
