require "spec_helper"

module ShipCompliant
  describe InventoryProduct do

    context "default_case" do
      it "returns the default case" do
        subject.default_case.should == 'DEFAULT-CASE'
      end
    end

    context "description" do
      it "returns the description" do
        subject.description.should == 'PRODUCT-DESCRIPTION'
      end
    end

    context "fulfillment_sku" do
      it "returns the fulfillment_sku" do
        subject.fulfillment_sku.should == 'FULFILLMENT-SKU'
      end
    end

    context "percent_alcohol" do
      it "returns the percent_alcohol" do
        subject.percent_alcohol.should == 98.43
      end
    end

    context "product_key" do
      it "returns the product_key" do
        subject.product_key.should == 'PRODUCT-KEY'
      end
    end

    context "product_type" do
      it "returns the product_key" do
        subject.product_type.should == 'PRODUCT-TYPE'
      end
    end

    context "unit_price" do
      it "returns the unit_price" do
        subject.unit_price.should == 873.21
      end
    end

    context "vintage" do
      it "returns the vintage" do
        subject.vintage.should == 1922
      end
    end

    context "volume_amount" do
      it "returns the volume_amount" do
        subject.volume_amount.should == 944.0
      end
    end

    context "volume_ml" do
      it "returns the volume_ml" do
        subject.volume_ml.should == 944.0
      end
    end

    context "volume_unit" do
      it "returns the volume_unit" do
        subject.volume_unit.should == 'Milliliter'
      end
    end

    subject do
      InventoryProduct.new({
        default_case: 'DEFAULT-CASE',
        description: 'PRODUCT-DESCRIPTION',
        fulfillment_sku: 'FULFILLMENT-SKU',
        percent_alcohol: '98.43',
        product_key: 'PRODUCT-KEY',
        product_type: 'PRODUCT-TYPE',
        unit_price: '873.21',
        vintage: '1922',
        volume_amount: '944',
        volume_ml: '944',
        volume_unit: 'Milliliter'
      })
    end

  end
end
