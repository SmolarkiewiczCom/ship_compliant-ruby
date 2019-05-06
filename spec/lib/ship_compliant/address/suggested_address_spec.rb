require "spec_helper"

module ShipCompliant
  describe SuggestedAddress do

    it { is_expected.to be_kind_of(Address) }

    context "details" do
      it "gets the details" do
        expect(subject.details).to eq({ address_details: true })
      end
    end

    context "parts" do
      it "gets the parts" do
        expect(subject.parts).to eq({ address_parts: true })
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
