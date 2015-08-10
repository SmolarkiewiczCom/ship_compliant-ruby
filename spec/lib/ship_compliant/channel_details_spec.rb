require "spec_helper"

module ShipCompliant
  describe ChannelDetails do

    context "order_channel" do
      it "gets the order_channel" do
        expect(subject.order_channel).to eq('order-channel')
      end
    end

    context "advertiser_key" do
      it "gets the advertiser_key" do
        expect(subject.advertiser_key).to eq('advertiser-key')
      end
    end
    
    context "advertiser_name" do
      it "gets the advertiser_name" do
        expect(subject.advertiser_name).to eq('advertiser-name')
      end
    end

    context "meta" do
      it "gets channel meta" do
        expect(subject.meta).to eq('channel-meta')
      end
    end

    subject do
      ChannelDetails.new({
        order_channel: 'order-channel',
        advertiser_key: 'advertiser-key',
        advertiser_name: 'advertiser-name',
        meta: 'channel-meta'
      })
    end

  end
end
