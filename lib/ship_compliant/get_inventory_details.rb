module ShipCompliant
  # == ShipCompliant::GetInventoryDetailsResult
  #
  # Provides inventory details for each Product on a Fulfillment Location,
  # Fulfillment Account basis.
  #
  #   result = ShipCompliant::GetInventoryDetails.call
  #
  #   result.quantity_for_product('PRODUCT-KEY') #=> {
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
    def self.call(query = {})
      query.deep_transform_keys! { |k| k.to_s.camelize }
      result = ShipCompliant.client.call(:get_inventory_details, query)
      GetInventoryDetailsResult.new(result)
    end

  end
end
