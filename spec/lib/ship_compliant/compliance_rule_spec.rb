require "spec_helper"

module ShipCompliant
  describe ComplianceRule do

    context "compliance_description" do
      it "gets the description" do
        expect(subject.compliance_description).to eq('Howdy Stranger')
      end
    end

    context "rule_description" do
      it "gets the rule" do
        expect(subject.rule_description).to eq('Must say hi to people you do not know.')
      end
    end

    context "compliant?" do
      it "check this rule passed" do
        expect(subject.compliant?).to be_truthy
      end
    end

    context "license_relationship" do
      it "gets the relationship" do
        expect(subject.license_relationship).to eq('StrangerToFriend')
      end
    end

    context "rule_type" do
      it "gets the rule type" do
        expect(subject.rule_type).to eq('BeCourteous')
      end
    end

    subject do
      ComplianceRule.new(
        compliance_description: 'Howdy Stranger',
        is_compliant: true,
        license_relationship: 'StrangerToFriend',
        rule_description: 'Must say hi to people you do not know.',
        rule_type: 'BeCourteous'
      )
    end

  end
end
