module ShipCompliant
  # == ShipCompliant::GetInventoryDetailsResult
  #
  # Wraps the result of +GetInventoryDetails+ and provides methods to access
  # locations and products for a location
  class GetInventoryDetailsResult < Struct.new(:response)
    include BaseResult

    # Returns an array of +InventoryLocation+ nodes.
    #
    #   result.locations[0][:sub_inventory_code] #=> 'SUB-CODE'
    def locations
      Array.wrap(response[:inventory_locations]).map do |location|
        location[:inventory_location]
      end
    end

    # Finds a location by +FulfillmentLocation+.
    #
    #   result.location('WineShipping')[:supplier] #=> 'LOCATION-SUPPLIER'
    def location(key)
      location = locations.select { |l| l[:fulfillment_location] == key }.first

      return {} if location.nil?
      location
    end

    # Returns an array of ShipCompliant::InventoryProduct.
    #
    #   result.products_for_location('WineShipping').each do |product|
    #     puts product.product_key
    #     puts "\t#{product.description}"
    #     puts "---\n"
    #   end
    def products_for_location(key)
      Array.wrap(location(key)[:inventory_products]).map do |product|
        InventoryProduct.new(product[:inventory_product])
      end
    end
  end
end
