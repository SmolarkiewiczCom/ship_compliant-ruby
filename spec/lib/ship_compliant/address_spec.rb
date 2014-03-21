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

    context "country" do
      it "gets the country" do
        subject.country.should == 'A Country'
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

      it "returns nil when empty" do
        subject.address[:zip2] = nil
        subject.zip2.should be_nil
      end
    end

    context "company" do
      it "gets company" do
        subject.company.should == 'Dippin Dots'
      end
    end

    context "date_of_birth" do
      it "gets date_of_birth" do
        subject.date_of_birth.should == Date.new(1967, 8, 12)
      end
    end

    context "email" do
      it "gets email" do
        subject.email.should == 'sogood@getdots.com'
      end
    end

    context "fax" do
      it "gets fax" do
        subject.fax.should == '(555) 123-8901'
      end
    end
    
    context "phone" do
      it "gets phone" do
        subject.phone.should == '(555) 123-4567'
      end
    end

    context "first_name" do
      it "gets first_name" do
        subject.first_name.should == 'Lt.'
      end
    end
    
    context "last_name" do
      it "gets last_name" do
        subject.last_name.should == 'Columbo'
      end
    end

    subject do
      Address.new(
        city: 'A City',
        county: 'A County',
        country: 'A Country',
        state: 'A State',
        street1: 'Street 1',
        street2: 'Street 2',
        zip1: '12345',
        zip2: '1234',

        company: 'Dippin Dots',
        date_of_birth: Date.new(1967, 8, 12),
        email: 'sogood@getdots.com',
        fax: '(555) 123-8901',
        phone: '(555) 123-4567',
        first_name: 'Lt.',
        last_name: 'Columbo'
      )
    end

  end
end
