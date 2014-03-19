module ShipCompliant
  # == ShipCompliant::InventoryProduct
  #
  # InventoryProduct is a value object that has methods to access product data from GetInventoryDetails.
  #   
  #  products = @inventory_results.products_for_location('WineShipping')
  #  
  #  products.each do |product|
  #    puts "[%s] %s" % [product.product_key, product.description]
  #  
  #    product.inventory_levels.each do |type, quantity|
  #      puts "%s are %s" % [quantity, type]
  #    end
  #  end
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

    # Returns a Hash of inventory levels.
    #
    # - The key is the +InventoryType+.
    # - The value is +Quantity+ as a float.
    #
    #     product.inventory_levels #=> {
    #       available: 2,
    #       on_hold: 2,
    #       back_order: 4
    #     }
    def inventory_levels
      levels = {}
      
      product[:inventory_levels][:inventory_level].each do |level|
        key = level[:inventory_type].underscore.to_sym
        value = level[:quantity].to_f

        levels[key] = value
      end

      levels
    end
  end
end
