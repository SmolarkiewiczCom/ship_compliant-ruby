require "spec_helper"

module ShipCompliant
  describe ChannelDetails do

    context "order_channel" do
      it "gets the order_channel" do
        subject.order_channel.should == 'order-channel'
      end
    end

    context "advertiser_key" do
      it "gets the advertiser_key" do
        subject.advertiser_key.should == 'advertiser-key'
      end
    end
    
    context "advertiser_name" do
      it "gets the advertiser_name" do
        subject.advertiser_name.should == 'advertiser-name'
      end
    end

    context "meta" do
      it "gets channel meta" do
        subject.meta.should == 'channel-meta'
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
