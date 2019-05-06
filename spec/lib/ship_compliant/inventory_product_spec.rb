require "spec_helper"

module ShipCompliant
  describe InventoryProduct do

    context "default_case" do
      it "returns the default case" do
        expect(subject.default_case).to eq('DEFAULT-CASE')
      end
    end

    context "description" do
      it "returns the description" do
        expect(subject.description).to eq('PRODUCT-DESCRIPTION')
      end
    end

    context "fulfillment_sku" do
      it "returns the fulfillment_sku" do
        expect(subject.fulfillment_sku).to eq('FULFILLMENT-SKU')
      end
    end

    context "percent_alcohol" do
      it "returns the percent_alcohol" do
        expect(subject.percent_alcohol).to eq(98.43)
      end
    end

    context "product_key" do
      it "returns the product_key" do
        expect(subject.product_key).to eq('PRODUCT-KEY')
      end
    end

    context "product_type" do
      it "returns the product_key" do
        expect(subject.product_type).to eq('PRODUCT-TYPE')
      end
    end

    context "unit_price" do
      it "returns the unit_price" do
        expect(subject.unit_price).to eq(873.21)
      end
    end

    context "vintage" do
      it "returns the vintage" do
        expect(subject.vintage).to eq(1922)
      end
    end

    context "volume_amount" do
      it "returns the volume_amount" do
        expect(subject.volume_amount).to eq(944.0)
      end
    end

    context "volume_ml" do
      it "returns the volume_ml" do
        expect(subject.volume_ml).to eq(944.0)
      end
    end

    context "volume_unit" do
      it "returns the volume_unit" do
        expect(subject.volume_unit).to eq('Milliliter')
      end
    end

    context "inventory_levels" do
      it "returns a hash of inventory levels" do
        expect(subject.inventory_levels).to eq({
          available: 100,
          on_hand: 20,
          some_amazing_type: 1000
        })
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
        volume_unit: 'Milliliter',
        inventory_levels: {
          inventory_level: [
            {
              random_key: 'PleaseIgnore',
              inventory_type: 'Available',
              quantity: '100'
            },
            {
              inventory_type: 'OnHand',
              quantity: '20'
            },
            {
              inventory_type: 'SomeAmazingType',
              quantity: '1000'
            }
          ]
        }
      })
    end

  end
end
