module ShipCompliant
  class ShipmentItem < Struct.new(:shipment_item)
    def brand_key
      shipment_item[:brand_key]
    end

    def product_quantity
      shipment_item[:product_quantity]
    end

    def product_key
      shipment_item[:product_key]
    end

    def product_unit_price
      shipment_item[:product_unit_price]
    end
  end
end
