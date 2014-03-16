require "spec_helper"

module ShipCompliant
  describe ProductSalesTaxRate do

    it { should be_kind_of(SalesTaxRate) }
    subject { ProductSalesTaxRate.new(brand_key: 'brand-key', product_key: 'the-product') }

    context "product_key" do
      it "returns the product key" do
        subject.product_key.should == 'the-product'
      end
    end

    context "brand_key" do
      it "returns the brand key" do
        subject.brand_key.should == 'brand-key'
      end
    end

  end
end
