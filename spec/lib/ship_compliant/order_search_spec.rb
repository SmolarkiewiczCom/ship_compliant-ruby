require "spec_helper"

module ShipCompliant
  describe OrderSearch do

    context "to_h" do
      it "converts keys to pascal case" do
        order = OrderSearch.new(sales_order_key_min: 10)
        order.to_h.should == {
          "SalesOrderKeyMin" => 10
        }
      end

      it "ignores invalid keys" do
        order = OrderSearch.new(xyz: 5)
        order.to_h.should == {}
      end
    end

  end
end
