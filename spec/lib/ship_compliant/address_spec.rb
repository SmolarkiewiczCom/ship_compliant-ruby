require "spec_helper"

module ShipCompliant
  describe Address do

    context "city" do
      it "gets the city" do
        expect(subject.city).to eq('A City')
      end
    end

    context "county" do
      it "gets the county" do
        expect(subject.county).to eq('A County')
      end
    end

    context "state" do
      it "gets the state" do
        expect(subject.state).to eq('A State')
      end
    end

    context "country" do
      it "gets the country" do
        expect(subject.country).to eq('A Country')
      end
    end

    context "street1" do
      it "gets street1" do
        expect(subject.street1).to eq('Street 1')
      end
    end

    context "street2" do
      it "gets street2" do
        expect(subject.street2).to eq('Street 2')
      end
    end

    context "zip1" do
      it "gets zip1" do
        expect(subject.zip1).to eq(12345)
      end
    end

    context "zip2" do
      it "gets zip2" do
        expect(subject.zip2).to eq(1234)
      end

      it "returns nil when empty" do
        subject.address[:zip2] = nil
        expect(subject.zip2).to be_nil
      end
    end

    context "company" do
      it "gets company" do
        expect(subject.company).to eq('Dippin Dots')
      end
    end

    context "date_of_birth" do
      it "gets date_of_birth" do
        expect(subject.date_of_birth).to eq(Date.new(1967, 8, 12))
      end
    end

    context "email" do
      it "gets email" do
        expect(subject.email).to eq('sogood@getdots.com')
      end
    end

    context "fax" do
      it "gets fax" do
        expect(subject.fax).to eq('(555) 123-8901')
      end
    end
    
    context "phone" do
      it "gets phone" do
        expect(subject.phone).to eq('(555) 123-4567')
      end
    end

    context "first_name" do
      it "gets first_name" do
        expect(subject.first_name).to eq('Lt.')
      end
    end
    
    context "last_name" do
      it "gets last_name" do
        expect(subject.last_name).to eq('Columbo')
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
