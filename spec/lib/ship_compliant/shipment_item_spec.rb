require "spec_helper"

module ShipCompliant
  describe ShipmentItem do

    it "gets the product_key" do
      subject.product_key.should == 'SKU'
    end

    it "gets the brand_key" do
      subject.brand_key.should == 'Whatever'
    end

    it "gets the product_quantity" do
      subject.product_quantity.should == '1'
    end

    it "gets the product_unit_price" do
      subject.product_unit_price.should == '60'
    end

    subject do
      ShipmentItem.new(
        product_key: 'SKU',
        brand_key: 'Whatever',
        product_quantity: '1',
        product_unit_price: '60'
      )
    end

  end
end
