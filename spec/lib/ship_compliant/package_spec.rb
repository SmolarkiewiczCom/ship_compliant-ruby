require "spec_helper"

module ShipCompliant
  describe Package do

    context "tracking_number" do
      it "gets the tracking_number" do
        subject.tracking_number.should == 'tracking-number'
      end
    end

    context "tracking_status" do
      it "gets the tracking_status" do
        subject.tracking_status.should == 'Lost in Transit'
      end
    end

    subject do
      Package.new(
        tracking_number: 'tracking-number',
        tracking_status: 'Lost in Transit'
      )
    end

  end
end
