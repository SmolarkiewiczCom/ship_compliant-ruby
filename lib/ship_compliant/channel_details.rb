module ShipCompliant
  # == ShipCompliant::ChannelDetails
  #
  # A value object that wraps the +OrderChanelDetails+ node.
  #
  #   channel_details = sales_order.channel_details
  #   puts channel_details.order_channel #=> 'MyOrders'
  class ChannelDetails < Struct.new(:channel)

    # Returns +OrderChannel+.
    def order_channel
      channel[:order_channel]
    end

    # Returns +AdvertiserKey+.
    def advertiser_key
      channel[:advertiser_key]
    end

    # Returns +AdvertiserName+.
    def advertiser_name
      channel[:advertiser_name]
    end

    # Returns +Meta+.
    def meta
      channel[:meta]
    end

  end
end
