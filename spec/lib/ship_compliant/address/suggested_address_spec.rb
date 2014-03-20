require "spec_helper"

module ShipCompliant
  describe SuggestedAddress do

    it { should be_kind_of(Address) }

    context "details" do
      it "gets the details" do
        subject.details.should == { address_details: true }
      end
    end

    context "parts" do
      it "gets the parts" do
        subject.parts.should == { address_parts: true }
      end
    end

    subject do
      SuggestedAddress.new(
        details: { address_details: true },
        parts: { address_parts: true }
      )
    end

  end
end
