module ShipCompliant
  # == ShipCompliant::CheckComplianceResult
  #
  # CheckComplianceResult wraps the response from the
  # +CheckComplianceOfSalesOrderWithAddressValidation+ API method.
  #
  # It provides methods to access nested objects and easily iterate over taxes
  # rates for shipments.
  # 
  #   compliant_status = ShipCompliant::CheckCompliance.of_sales_order({
  #     # attributes here
  #   })
  #
  #   compliant_status.compliant? #=> true
  class CheckComplianceResult < Struct.new(:response)
    include BaseResult

    # Returns true if all shipments of a SalesOrder are compliant.
    def compliant?
      response[:sales_order][:is_compliant] == true
    end

    # Returns a float of the recommended sales tax due for a SalesOrder.
    def recommended_tax_due
      response[:sales_order][:sales_tax_rates][:recommended_sales_tax_due].to_f
    end

    # Access the tax information for a shipment. Returns an instance of
    # ShipmentSalesTaxRate.
    def taxes_for_shipment(shipment_key)
      shipment = shipment_sales_tax_rates.select { |s| s[:@shipment_key] == shipment_key }.first

      # convert attribute keys to symbols
      freight = attributes_to_symbols(shipment[:freight_sales_tax_rate])

      # wrap products in ProductSalesTaxRate
      products = wrap_products(shipment[:product_sales_tax_rates])

      ShipmentSalesTaxRate.new(shipment_key, FreightSalesTaxRate.new(freight), products)
    end

    # This method returns an Array containing information about each shipment of a
    # SalesOrder.
    def shipment_sales_tax_rates
      Array.wrap(response[:sales_order][:sales_tax_rates][:shipment_sales_tax_rates][:shipment_sales_tax_rate])
    end

    # Returns an array of the +ShipmentComplianceResponse+ node as a Hash.
    #
    #   compliance_result.shipment_compliance_rules.each do |shipment|
    #     puts "SHIPMENT '#{shipment[:key]}' IS NOT COMPLIANT" unless shipment[:is_compliant]
    #   end
    def shipment_compliance_rules
      Array.wrap(response[:sales_order][:shipments][:shipment_compliance_response])
    end

    # Finds all the compliance rules for a shipment.
    # Returns an instance of ShipmentCompliance.
    #
    #  shipment_compliance = compliance_result.compliance_rules_for_shipment('SHIPMENT-KEY')
    #  puts shipment_compliance.compliant? #=> false
    def compliance_rules_for_shipment(shipment_key)
      shipment = shipment_compliance_rules.select { |s| s[:key] == shipment_key }.first
      ShipmentCompliance.new(shipment)
    end

    # Returns the +AddressValidationResult+.
    def address_validation_result
      response[:address_validation_result]
    end

    # Returns an instance of Address.
    def suggested_address
      SuggestedAddress.new(response[:suggested_address])
    end

    private
    
    # Nori returns XML attributes as a key beginning with a spiral (@).
    # This removes the spiral and changes key to a symbol.
    def attributes_to_symbols(object)
      object.transform_keys do |key|
        key.to_s.gsub('@', '').to_sym
      end
    end

    # Wraps each +ProductSalesTaxRates+ node with
    # ShipCompliant::ProductSalesTaxRate
    def wrap_products(products)
      Array.wrap(products[:product_sales_tax_rate]).map do |product|
        ProductSalesTaxRate.new(attributes_to_symbols(product))
      end
    end
  end
end
