require "spec_helper"

module ShipCompliant
  class FauxResult < Struct.new(:data)
    include BaseResult
  end
end

module ShipCompliant
  describe BaseResult do

    let(:success_message) { {response_status: "Success"} }
    let(:failure_message) do
      {
        errors: {
          error: {
            code: "200",
            key: "OrderId",
            message: "I'm smarter than the average bear, Boo Boo",
            target: "SalesOrder",
            type: "Validation"
          }
        },
        response_status: "Failure"
      }
    end

    context "success?" do
      it "returns true for successful response status" do
        result = FauxResult.new(success_message)
        result.success?.should be_true
      end

      it "returns false for failed response status" do
        result = FauxResult.new(failure_message)
        result.success?.should be_false
      end
    end

    context "failure?" do
      it "returns opposite of success?" do
        result = FauxResult.new({})
        result.stub(:success?) { false }
        result.failure?.should be_true
      end
    end

    context "error_message" do
      it "gets the error message" do
        result = FauxResult.new(failure_message)
        result.error_message.should == "I'm smarter than the average bear, Boo Boo"
      end

      it "returns nil when successful" do
        result = FauxResult.new(success_message)
        result.error_message.should be_nil
      end
    end

    context "error_code" do
      it "gets the error code" do
        result = FauxResult.new(failure_message)
        result.error_code.should == 200
      end

      it "returns 0 when successful" do
        result = FauxResult.new(success_message)
        result.error_code.should == 0
      end
    end

    context "error_key" do
      it "gets the error key" do
        result = FauxResult.new(failure_message)
        result.error_key.should == "OrderId"
      end

      it "returns nil when successful" do
        result = FauxResult.new(success_message)
        result.error_key.should be_nil
      end
    end
  end
end
