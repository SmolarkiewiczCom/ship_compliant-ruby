require "spec_helper"

module ShipCompliant
  describe ShipmentCompliance do

    context "compliant?" do
      it "check is a shipment was compliant" do
        expect(subject.compliant?).to be_truthy
      end
    end

    context "shipment_key" do
      it "returns the shipment key" do
        expect(subject.shipment_key).to eq('AN-ORDER-KEY')
      end
    end

    context "rules" do
      it "returns an array of ComplianceRule" do
        expect(subject.rules).to eq([
          ComplianceRule.new(compliance_description: "You're clear for take off ghost rider")
        ])
      end

      it "returns an empty array when none found" do
        shipment = ShipmentCompliance.new({
          rules: nil
        })

        expect(shipment.rules).to eq([])
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
