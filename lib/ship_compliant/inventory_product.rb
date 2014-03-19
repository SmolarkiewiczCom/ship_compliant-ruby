module ShipCompliant
  class InventoryProduct < Struct.new(:product)

    # Returns the +DefaultCase+ of a product.
    def default_case
      product[:default_case]
    end

    # Returns the +ProductKey+ of a product.
    def product_key
      product[:product_key]
    end

    # Returns the +ProductType+ of a product.
    def product_type
      product[:product_type]
    end

    # Returns the +Description+ of a product.
    def description
      product[:description]
    end

    # Returns the +UnitPrice+ of a product as a float.
    def unit_price
      product[:unit_price].to_f
    end

    # Returns the +FulfillmentSku+ of a product.
    def fulfillment_sku
      product[:fulfillment_sku]
    end

    # Returns the +PercentAlcohol+ of a product as a float.
    def percent_alcohol
      product[:percent_alcohol].to_f
    end

    # Returns the +Vintage+ of a product as an integer.
    def vintage
      product[:vintage].to_i
    end

    # Returns the +VolumeAmount+ of a product as a float.
    def volume_amount
      product[:volume_amount].to_f
    end

    # Returns the +VolumeML+ of a product as a float.
    def volume_ml
      product[:volume_ml].to_f
    end

    # Returns the +VolumeUnit+ of a product.
    def volume_unit
      product[:volume_unit]
    end

  end
end
