module ShipCompliant
  class ChannelDetails < Struct.new(:channel)

    def order_channel
      channel[:order_channel]
    end

    def advertiser_key
      channel[:advertiser_key]
    end

    def advertiser_name
      channel[:advertiser_name]
    end

    def meta
      channel[:meta]
    end

  end
end
