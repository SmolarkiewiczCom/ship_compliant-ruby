require "spec_helper"

module ShipCompliant
  class FauxResult < Struct.new(:response)
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
            code: "404",
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
        expect(result.success?).to be_truthy
      end

      it "returns false for failed response status" do
        result = FauxResult.new(failure_message)
        expect(result.success?).to be_falsey
      end
    end

    context "failure?" do
      it "returns opposite of success?" do
        result = FauxResult.new({})
        allow(result).to receive(:success?) { false }
        expect(result.failure?).to be_truthy
      end
    end

    context "errors" do
      it "returns an array of errors" do
        result = FauxResult.new(failure_message)
        expect(result.errors).to eq([
          ErrorResult.new({
              code: "404",
              key: "OrderId",
              message: "I'm smarter than the average bear, Boo Boo",
              target: "SalesOrder",
              type: "Validation"
          })
        ])
      end

      it "doesn't break when errors is already an array" do
        result = FauxResult.new({
          response_status: 'Failure',
          errors: [
            {error: { code: '404' }},
            {error: { code: '500' }}
          ]
        })

        expect(result.errors).to eq([
          ErrorResult.new(code: '404'),
          ErrorResult.new(code: '500')
        ])
      end

      it "returns an empty array for successful response" do
        result = FauxResult.new(success_message)
        expect(result.errors).to eq([])
      end
    end

    context "errors_count" do
      it "counts the number of errors" do
        result = FauxResult.new({})
        allow(result).to receive(:errors) { [1, 2, 3 ] }
        expect(result.errors_count).to eq(3)
      end
    end

    # context "error_message" do
    #   it "gets the error message" do
    #     result = FauxResult.new(failure_message)
    #     result.error_message.should == "I'm smarter than the average bear, Boo Boo"
    #   end

    #   it "returns nil when successful" do
    #     result = FauxResult.new(success_message)
    #     result.error_message.should be_nil
    #   end
    # end

    # context "error_code" do
    #   it "gets the error code" do
    #     result = FauxResult.new(failure_message)
    #     result.error_code.should == 200
    #   end

    #   it "returns 0 when successful" do
    #     result = FauxResult.new(success_message)
    #     result.error_code.should == 0
    #   end
    # end

    # context "error_key" do
    #   it "gets the error key" do
    #     result = FauxResult.new(failure_message)
    #     result.error_key.should == "OrderId"
    #   end

    #   it "returns nil when successful" do
    #     result = FauxResult.new(success_message)
    #     result.error_key.should be_nil
    #   end
    # end
  end
end
