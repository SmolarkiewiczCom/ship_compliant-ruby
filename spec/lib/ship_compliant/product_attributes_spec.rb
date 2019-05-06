require "spec_helper"

module ShipCompliant
  describe ProductAttributes do

    context "to_h" do
      it "converts keys to pascal case" do
        product = ProductAttributes.new(unit_price: 10)
        expect(product.to_h).to eq({
          "UnitPrice" => 10
        })
      end

      it "handles special cases" do
        product = ProductAttributes.new(
          bottle_size_ml: 'value',
          gtin: 'value',
          nabca: 'value',
          scc: 'value',
          unimerc: 'value',
          upc: 'value'
        )

        expect(product.to_h).to eq({
          'BottleSizeML' => 'value',
          'GTIN' => 'value',
          'NABCA' => 'value',
          'SCC' => 'value',
          'UNIMERC' => 'value',
          'UPC' => 'value'
        })
      end
    end

  end
end
