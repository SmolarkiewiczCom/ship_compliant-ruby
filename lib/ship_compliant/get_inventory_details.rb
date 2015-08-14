module ShipCompliant
  # == ShipCompliant::GetInventoryDetails
  #
  # Provides inventory details for each Product on a Fulfillment Location,
  # Fulfillment Account basis.
  #
  #   result = ShipCompliant::GetInventoryDetails.call
  #   product = result.products_for_location('WineShipping').first
  #
  #   product.inventory_levels #=> {
  #     available: 25,
  #     reserved: 13
  #   }
  class GetInventoryDetails

    # Returns inventory details for the specified criteria. The method may be
    # called without any parameters to return all products with Available
    # inventory.
    #
    #   ShipCompliant::GetInventoryDetails.call({
    #     brand_key: 'BRAND-KEY',
    #     fulfillment_location: 'WineShipping'
    #   })
    def self.call(query: {}, configuration: :default)
      query.deep_transform_keys! { |k| k.to_s.camelize }
      result = ShipCompliant.client(configuration: configuration).call(:get_inventory_details, query)
      GetInventoryDetailsResult.new(result)
    end

  end
end
