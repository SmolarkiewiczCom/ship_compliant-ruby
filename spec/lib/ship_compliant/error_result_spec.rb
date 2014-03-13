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
        subject.code.should == 404
      end
    end

    context "key" do
      it "gets the key" do
        subject.key.should == "OrderId"
      end
    end

    context "message" do
      it "gets the message" do
        subject.message.should == "I'm smarter than the average bear, Boo Boo"
      end
    end

    context "target" do
      it "gets the target" do
        subject.target.should == "SalesOrder"
      end
    end

    context "type" do
      it "gets the type" do
        subject.type.should == "Validation"
      end
    end
  end
end
