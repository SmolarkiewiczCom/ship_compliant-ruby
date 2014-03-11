module ShipCompliant
  class OrderSearch < Struct.new(:details)
    KEYS = [
      :channel,
      :compliance_status,

      :external_club_key,
      :external_offer_key,
      :external_sales_order_key_max,
      :external_sales_order_keys,

      :fulfillment_house,
      :fulfillment_status,
      :fulfillment_account,
      :fulfillment_exception_type,
      
      :license_relationship_type,
      :not_tag,
      :purchase_date_max,
      :purchase_date_min,

      :requested_ship_date_max,
      :requested_ship_date_min,

      :sale_type,
      :sales_order_keys,
      :sales_order_key_min,
      :sales_order_key_max,

      :settlement_batch_number,
      :shipment_status,
      :ship_date_max,
      :ship_date_min,
      :ship_to_state,

      :tag,
      :tracking_existence,
    ]

    # Returns product details hash with Pascal case keys.
    def to_h
      hash = {}
      details.each do |key, value|
        next unless KEYS.include?(key)
        hash[key.to_s.classify] = value unless value.nil?
      end
      hash
    end
  end
end
