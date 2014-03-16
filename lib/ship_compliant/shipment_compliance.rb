module ShipCompliant
  class ShipmentCompliance < Struct.new(:result)

    def compliant?
      result[:is_compliant]
    end

    def shipment_key
      result[:key]
    end

    def rules
      Array.wrap(result[:rules][:rule_compliance_response]).map do |rule|
        ComplianceRule.new(rule)
      end
    end

  end
end
