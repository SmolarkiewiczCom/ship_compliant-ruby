module ShipCompliant
  class Shipment < Struct.new(:shipment)

    def fulfillment_house
      shipment[:fulfillment_house]
    end

    def fulfillment_exception_reason
      shipment[:fulfillment_exception_reason]
    end

    def fulfillment_exception_type
      shipment[:fulfillment_exception_type]
    end

    def fulfillment_status
      shipment[:fulfillment_status]
    end

    def handling
      shipment[:handling].to_f
    end

    def insured_amount
      shipment[:insured_amount].to_f
    end

    def shipping
      shipment[:shipping].to_f
    end

    def ship_date
      shipment[:ship_date]
    end

    def shipment_status
      shipment[:shipment_status]
    end

    def shipping_service
      shipment[:shipping_service]
    end

    def special_instructions
      shipment[:special_instructions]
    end

    def packages
      Array.wrap(shipment[:packages]).map do |package|
        Package.new(package[:package])
      end
    end

    def shipment_items
      Array.wrap(shipment[:shipment_items]).map do |shipment_item|
        ShipmentItem.new(shipment_item[:shipment_item])
      end
    end

    def ship_to
      Address.new(shipment[:ship_to])
    end

  end
end
