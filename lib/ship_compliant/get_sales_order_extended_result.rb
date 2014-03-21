module ShipCompliant
  class GetSalesOrderExtendedResult < Struct.new(:response)
    include BaseResult

    # Returns an array of the +ShipmentComplianceResponse+ node as a Hash.
    #
    #   sales_order.shipment_compliance_rules.each do |shipment|
    #     puts "SHIPMENT '#{shipment[:key]}' IS NOT COMPLIANT" unless shipment[:is_compliant]
    #   end
    def shipment_compliance_rules
      Array.wrap(response[:compliance_results][:sales_order][:shipments][:shipment_compliance_response]).map do |shipment|
        shipment
      end
    end

    # Finds all the compliance rules for a shipment.
    # Returns an instance of ShipmentCompliance.
    #
    #   shipment_compliance = sales_order.compliance_rules_for_shipment('SHIPMENT-KEY')
    #   puts shipment_compliance.compliant? #=> false
    def compliance_rules_for_shipment(shipment_key)
      shipment = shipment_compliance_rules.select { |s| s[:key] == shipment_key }.first
      ShipmentCompliance.new(shipment)
    end

    # Returns a ShipCompliant::Address with the customer's billing information.
    #
    #   puts sales_order.bill_to.state #=> 'AK'
    def bill_to
      Address.new(response[:sales_order][:bill_to])
    end

    # Returns an array of +Shipment+ nodes as a Hash.
    #
    #   sales_order.shipments.each do |shipment|
    #     puts shipment[:ship_date] #=> DateTime
    #   end
    def shipments
      Array.wrap(response[:sales_order][:shipments]).map do |shipment|
        shipment[:shipment]
      end
    end

    # Finds a shipment by +ShipmentKey+. Returns an instance of ShipCompliant::Shipment.
    #
    #   shipment = sales_order.find_shipment('1')
    #   puts shipment.ship_date #=> DateTime
    def find_shipment(shipment_key)
      shipment = shipments.select { |s| s[:shipment_key] == shipment_key }.first
      Shipment.new(shipment)
    end
  end
end
