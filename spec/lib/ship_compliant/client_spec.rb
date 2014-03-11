require "spec_helper"

module ShipCompliant
  describe Client do

    it "inherits from Savon::Client" do
      ShipCompliant.client.should be_kind_of(Savon::Client)
    end

    it "uses log value from configuration" do
      # configuration is defined in spec_helper.rb
      ShipCompliant.client.globals[:log].should == false
    end

  end
end
