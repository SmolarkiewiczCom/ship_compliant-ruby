module ShipCompliant
  # == ShipCompliant::ProductSalesTaxRate
  #
  # ProductSalesTaxRate wraps the SalesTaxRate value object. It provides methods
  # to easily access various attributes about each product.
  class ProductSalesTaxRate < SalesTaxRate

    # Returns the product's key.
    #
    #   product_tax_rate.product_key #=> 'ProductKey123'
    def product_key
      sales_tax[:product_key]
    end

    # Returns the product's brand key.
    #
    #   product_tax_rate.brand_key #=> 'BrandKey123'
    def brand_key
      sales_tax[:brand_key]
    end

  end
end
