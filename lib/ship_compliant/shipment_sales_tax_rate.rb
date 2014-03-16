module ShipCompliant
  # == ShipCompliant::ShipmentSalesTaxRate
  #
  # ShipmentSalesTaxRate gives access about a shipment's freight and product tax
  # details.
  #
  # It also provides a helper method to find a product by its key.
  class ShipmentSalesTaxRate < Struct.new(:shipment_key, :freight, :products)

    def taxes_for_product(product_key)
      products.select { |product| product.product_key == product_key }.first
    end

  end
end
