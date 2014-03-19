require "spec_helper"

module ShipCompliant

  describe GetInventoryDetailsResult do
    it_behaves_like "BaseResult"

    context "locations" do
      it "returns an array of locations" do
        subject.locations.should == [
          inventory_location[:inventory_location]
        ]
      end

      it "handles a single location" do
        result = GetInventoryDetailsResult.new({
          inventory_locations: inventory_location
        })

        result.locations.should == [
          inventory_location[:inventory_location]
        ]
      end
    end

    context "location" do
      it "finds a location" do
        subject.location('WineShipping').should == inventory_location[:inventory_location]
      end

      it "returns an empty hash when invalid" do
        subject.location('toys-r-us').should == {}
      end
    end

    context "products_for_location" do
      it "returns an array of products" do
        subject.products_for_location('WineShipping').should == [
          InventoryProduct.new(product_key: 'PRODUCT-KEY', inventory_levels: inventory_level)
        ]
      end

      it "returns empty array for invalid location" do
        subject.products_for_location('toys-r-us').should == []
      end
    end

    let(:inventory_level) do
      {
        inventory_level: {
          effective_date: DateTime.new(2014, 3, 13, 18, 0, 6),
          inventory_type: "Available",
          quantity: "25",
          synchronization_date: DateTime.new(2014, 3, 13, 18, 0, 6)
        }
      }
    end

    let(:inventory_location) do
      {
        inventory_location: {
          fulfillment_account: nil,
          fulfillment_location: "WineShipping",
          inventory_products: [
            {
              inventory_product: {
                product_key: 'PRODUCT-KEY',
                inventory_levels: inventory_level
              }
            }
          ],
          sub_inventory_code: nil,
          supplier: "ShipC Library Wines"
        }
      }
    end

    subject do
      GetInventoryDetailsResult.new({
        inventory_locations: [
          inventory_location
        ],
        response_status: "Success"
      })
    end
  end
end
