module ShipCompliant
  # == ShipCompliant::ShipmentCompliance
  #
  # Wrap the +ShipmentComplianceResponse+ node.
  class ShipmentCompliance < Struct.new(:result)

    # Checks if the shipment was compliant.
    def compliant?
      result[:is_compliant]
    end

    # Returns the shipment key.
    def shipment_key
      result[:key]
    end

    # Wraps the +RuleComplianceResponse+ nodes with ComplianceRule.
    #
    #   compliance_errors = shipment.rules.reject { |r| r.compliant? }
    def rules
      return [] if result[:rules].nil?
      Array.wrap(result[:rules][:rule_compliance_response]).map do |rule|
        ComplianceRule.new(rule)
      end
    end

  end
end
