require "spec_helper"

module ShipCompliant
  describe ErrorResult do
    let(:error) do
      {
        code: "404",
        key: "OrderId",
        message: "I'm smarter than the average bear, Boo Boo",
        target: "SalesOrder",
        type: "Validation"
      }
    end

    subject { ErrorResult.new(error) }

    context "code" do
      it "returns the code as an integer" do
        expect(subject.code).to eq(404)
      end
    end

    context "key" do
      it "gets the key" do
        expect(subject.key).to eq("OrderId")
      end
    end

    context "message" do
      it "gets the message" do
        expect(subject.message).to eq("I'm smarter than the average bear, Boo Boo")
      end
    end

    context "target" do
      it "gets the target" do
        expect(subject.target).to eq("SalesOrder")
      end
    end

    context "type" do
      it "gets the type" do
        expect(subject.type).to eq("Validation")
      end
    end
  end
end
