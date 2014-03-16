require "spec_helper"

module ShipCompliant
  describe ShipmentCompliance do

    context "compliant?" do
      it "check is a shipment was compliant" do
        subject.compliant?.should be_true
      end
    end

    context "shipment_key" do
      it "returns the shipment key" do
        subject.shipment_key.should == 'AN-ORDER-KEY'
      end
    end

    context "rules" do
      it "returns an array of ComplianceRule" do
        subject.rules.should == [
          ComplianceRule.new(compliance_description: "You're clear for take off ghost rider")
        ]
      end
    end

    subject do
      ShipmentCompliance.new(
        is_compliant: true,
        key: 'AN-ORDER-KEY',
        rules: {
          rule_compliance_response: {
            compliance_description: "You're clear for take off ghost rider"
          }
        }
      )
    end
  end
end
