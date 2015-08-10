require "spec_helper"

module ShipCompliant
  describe ProductSalesTaxRate do

    it { should be_kind_of(SalesTaxRate) }
    subject { ProductSalesTaxRate.new(brand_key: 'brand-key', product_key: 'the-product') }

    context "product_key" do
      it "returns the product key" do
        expect(subject.product_key).to eq('the-product')
      end
    end

    context "brand_key" do
      it "returns the brand key" do
        expect(subject.brand_key).to eq('brand-key')
      end
    end

  end
end
