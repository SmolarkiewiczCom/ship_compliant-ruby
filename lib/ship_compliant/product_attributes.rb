module ShipCompliant
  # === ShipCompliant::ProductAttributes
  #
  # Acts as a hash for working with the +AddUpdateProduct+ API endpoint.
  #
  #   attributes = ShipCompliant::ProductAttributes({
  #     bottle_size_ml: 750,
  #     gtin: 'value',
  #     product_description: 'It's great!'
  #   })
  #
  #   attributes.to_h #=> {
  #     'BottleSizeML' => 750,
  #     'GTIN' => 'value',
  #     'ProductDescription' => 'It's great!'
  #   }
  class ProductAttributes < Struct.new(:details)
    # == Available Product Attributes
    #
    #   * +age+
    #   * +bottle_size_ml+
    #   * +brand_key+
    #   * +default_case+
    #   * +default_retail_unit_price+
    #   * +default_retail_case_price+
    #   * +description+
    #   * +flavor+
    #   * +gtin+
    #   * +label+
    #   * +percent_alcohol+
    #   * +product_key+
    #   * +product_type+
    #   * +product_description+
    #   * +nabca+
    #   * +scc+
    #   * +upc+
    #   * +unimerc+
    #   * +unit_price+
    #   * +varietal+
    #   * +vintage+
    #   * +volume_amount+
    #   * +volume_unit+
    KEYS = [
      :age,
      :bottle_size_ml,
      :brand_key,

      :default_case,
      :default_retail_unit_price,
      :default_retail_case_price,
      :description,

      :flavor,
      :gtin,
      :label,
      
      :percent_alcohol,
      :product_key,
      :product_type,
      :product_description,

      :nabca,
      :scc,
      :upc,
      :unimerc,
      :unit_price,

      :varietal,
      :vintage,
      :volume_amount,
      :volume_unit
    ]

    SPECIAL_CASES = {
      gtin: 'GTIN',
      nabca: 'NABCA',
      scc: 'SCC',
      unimerc: 'UNIMERC',
      upc: 'UPC',
      bottle_size_ml: 'BottleSizeML'
    }

    # Converts hash keys to Pascal case and handles special cases.
    #
    #   :bottle_size_ml #=> 'BottleSizeML'
    def to_h
      hash = {}
      details.each do |key, value|
        # handle special cases
        pascal_key = key.to_s.classify
        if SPECIAL_CASES.has_key?(key)
          pascal_key = SPECIAL_CASES[key]
        end

        hash[pascal_key] = value unless value.nil?
      end
      hash
    end
  end
end
