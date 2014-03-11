require "spec_helper"

module ShipCompliant
  describe Client do

    it "inherits from Savon::Client" do
      ShipCompliant.client.should be_kind_of(Savon::Client)
    end

  end
end
