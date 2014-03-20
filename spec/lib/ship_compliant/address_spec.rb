require "spec_helper"

module ShipCompliant
  describe Address do

    context "city" do
      it "gets the city" do
        subject.city.should == 'A City'
      end
    end

    context "county" do
      it "gets the county" do
        subject.county.should == 'A County'
      end
    end

    context "state" do
      it "gets the state" do
        subject.state.should == 'A State'
      end
    end

    context "street1" do
      it "gets street1" do
        subject.street1.should == 'Street 1'
      end
    end

    context "street2" do
      it "gets street2" do
        subject.street2.should == 'Street 2'
      end
    end

    context "zip1" do
      it "gets zip1" do
        subject.zip1.should == 12345
      end
    end

    context "zip2" do
      it "gets zip2" do
        subject.zip2.should == 1234
      end
    end

    context "details" do
      it "gets the details" do
        subject.details.should == { address_details: true }
      end
    end

    context "parts" do
      it "gets the parts" do
        subject.parts.should == { address_parts: true }
      end
    end

    subject do
      Address.new(
        city: 'A City',
        county: 'A County',
        state: 'A State',
        street1: 'Street 1',
        street2: 'Street 2',
        zip1: '12345',
        zip2: '1234',
        details: { address_details: true },
        parts: { address_parts: true }
      )
    end

  end
end
