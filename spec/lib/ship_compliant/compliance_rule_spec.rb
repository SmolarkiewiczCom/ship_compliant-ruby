require "spec_helper"

module ShipCompliant
  describe ComplianceRule do

    context "compliance_description" do
      it "gets the description" do
        subject.compliance_description.should == 'Howdy Stranger'
      end
    end

    context "rule_description" do
      it "gets the rule" do
        subject.rule_description.should == 'Must say hi to people you do not know.'
      end
    end

    context "compliant?" do
      it "check this rule passed" do
        subject.compliant?.should be_true
      end
    end

    context "license_relationship" do
      it "gets the relationship" do
        subject.license_relationship.should == 'StrangerToFriend'
      end
    end

    context "rule_type" do
      it "gets the rule type" do
        subject.rule_type.should == 'BeCourteous'
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
