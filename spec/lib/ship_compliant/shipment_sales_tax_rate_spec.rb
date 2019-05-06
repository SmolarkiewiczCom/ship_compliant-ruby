require "spec_helper"

module ShipCompliant
  describe ShipmentSalesTaxRate do

    context "taxes_for_product" do
      it "returns product sales tax rate" do
        product_1, product_2, product_3 = [1, 2, 3].map { |p_id| ProductSalesTaxRate.new(product_key: "product-#{p_id}") }
        shipment = ShipmentSalesTaxRate.new(nil, nil, [
          product_1,
          product_2,
          product_3
        ])

        expect(shipment.taxes_for_product('product-2')).to eq(product_2)
      end
    end

  end
end
