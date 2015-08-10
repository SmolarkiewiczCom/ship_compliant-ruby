require "spec_helper"

module ShipCompliant
  describe OrderSearch do

    context "to_h" do
      it "converts keys to pascal case" do
        order = OrderSearch.new(sales_order_key_min: 10)
        expect(order.to_h).to eq({
          "SalesOrderKeyMin" => 10
        })
      end

      it "ignores invalid keys" do
        order = OrderSearch.new(xyz: 5)
        expect(order.to_h).to eq({})
      end
    end

  end
end
