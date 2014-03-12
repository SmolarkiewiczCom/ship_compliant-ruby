require "spec_helper"

module ShipCompliant
  describe AddUpdateProductResult do
    context "success?" do
      it "returns true when the response was successful" do
        result = AddUpdateProductResult.new({ response_status: 'Success' })
        result.success?.should be_true
      end
    end

    context "failure?" do
      it "returns the opposite of success?" do
        result = AddUpdateProductResult.new({})
        result.stub(:success?) { false }
        result.failure?.should be_true
      end
    end
  end
end
