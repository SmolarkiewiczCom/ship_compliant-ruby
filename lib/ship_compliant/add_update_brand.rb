module ShipCompliant
  class AddUpdateBrand

    def self.brand(details, options = {})
      result = ShipCompliant.client.call(:add_update_brand, {
        'Brand' => details.deep_transform_keys { |key| key.to_s.camelize },
        'UpdateMode' => options.fetch(:update_mode, 'ErrorOnExisting')
      })

      AddUpdateBrandResult.new(result)
    end

  end
end
