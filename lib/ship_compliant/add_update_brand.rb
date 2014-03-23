module ShipCompliant
  # == ShipCompliant::AddUpdateBrand
  #
  # Checks to see if a brand with the same key already exists. If one does not
  # exist, it will add the brand with the specified name. If a brand exists
  # with the same brand key then the brand name will be updated.
  #
  # Use this method to add a new brand or update an existing brand in the
  # system. A brand must be defined before adding products.
  #
  #   ShipCompliant::AddUpdateBrand.brand({
  #     key: 'DENSNW',
  #     name: 'Denver Snow',
  #     
  #     this_brand_is_bottled_by_a_third_party: false,
  #     this_brand_is_produced_by_a_third_party: false,
  #     this_brand_operates_under_a_trade_name: false,
  #     this_brand_was_acquired_from_a_third_party: false
  #   })
  class AddUpdateBrand

    # Adds or updates a brand depending on +:update_mode+.
    #
    # +brand+ parameter must be a Hash.
    #
    # === Options
    #
    # You can specify the update mode by passing a hash as the second argument.
    # The default is +ErrorOnExisting+.
    #
    # Available options are.
    #
    # * UpdateExisting - Existing brand information is updated.
    # * IgnoreExisting - Pre-existing information is not updated.
    # * ErrorOnExisting - An error message is returned if the brand already exists.
    #
    #     ShipCompliant::AddUpdateBrand.product({
    #       # brand attributes
    #     }, update_mode: 'UpdateExisting')
    def self.brand(brand, options = {})
      result = ShipCompliant.client.call(:add_update_brand, {
        'Brand' => brand.deep_transform_keys { |key| key.to_s.camelize },
        'UpdateMode' => options.fetch(:update_mode, 'ErrorOnExisting')
      })

      AddUpdateBrandResult.new(result)
    end

  end
end
