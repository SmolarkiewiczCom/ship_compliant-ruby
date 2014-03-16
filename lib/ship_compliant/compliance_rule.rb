module ShipCompliant
  class ComplianceRule < Struct.new(:response)

    # Returns the +ComplianceDescription+.
    def compliance_description
      response[:compliance_description]
    end

    # Checks if the current compliance rule was met.
    def compliant?
      response[:is_compliant]
    end

    # Returns the +RuleDescription+.
    def rule_description
      response[:rule_description]
    end

    # Returns the +LicenseRelationship+.
    def license_relationship
      response[:license_relationship]
    end

    # Returns the +RuleType+.
    def rule_type
      response[:rule_type]
    end

  end
end
