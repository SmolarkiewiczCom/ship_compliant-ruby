require "spec_helper"

module ShipCompliant
  describe Shipment do

    context "fulfillment_house" do
      it "gets the fulfillment_house" do
        expect(subject.fulfillment_house).to eq('Chucky Cheese')
      end
    end

    context "fulfillment_exception_reason" do
      it "gets the fulfillment_exception_reason" do
        expect(subject.fulfillment_exception_reason).to eq('Cheese must be aged.')
      end
    end
    
    context "fulfillment_exception_type" do
      it "gets the fulfillment_exception_type" do
        expect(subject.fulfillment_exception_type).to eq('None')
      end
    end

    context "fulfillment_status" do
      it "gets the fulfillment_status" do
        expect(subject.fulfillment_status).to eq('Accepted')
      end
    end

    context "handling" do
      it "gets the handling" do
        expect(subject.handling).to eq(338.33)
      end
    end

    context "insured_amount" do
      it "gets the insured_amount" do
        expect(subject.insured_amount).to eq(10000.33)
      end
    end

    context "shipping" do
      it "gets the shipping" do
        expect(subject.shipping).to eq(23.44)
      end
    end

    context "ship_date" do
      it "gets the ship_date" do
        expect(subject.ship_date).to eq(Date.new(2014, 1, 1))
      end
    end

    context "shipment_status" do
      it "gets the shipment_status" do
        expect(subject.shipment_status).to eq('Delivered')
      end
    end

    context "shipping_service" do
      it "gets the shipping_service" do
        expect(subject.shipping_service).to eq('Snortn Boar Transport')
      end
    end

    context "special_instructions" do
      it "gets the special_instructions" do
        expect(subject.special_instructions).to eq('Get autograph')
      end
    end

    context "packages" do
      it "gets the packages" do
        expect(subject.packages).to eq([Package.new(tracking: 'info here')])
      end
    end

    context "shipment_items" do
      it "gets the shipment_items" do
        subject.shipment_items.should == [ShipmentItem.new(product_key: 'SKU')]
      end
    end

    context "ship_to" do
      it "gets the shipping address" do
        expect(subject.ship_to).to eq(Address.new(country: 'US'))
      end
    end

    subject do
      Shipment.new({
        fulfillment_house: 'Chucky Cheese',
        fulfillment_exception_reason: 'Cheese must be aged.',
        fulfillment_exception_type: 'None',
        fulfillment_status: 'Accepted',

        handling: '338.33',
        insured_amount: '10000.33',
        shipping: '23.44',

        ship_date: Date.new(2014, 1, 1),
        shipment_status: 'Delivered',
        shipping_service: 'Snortn Boar Transport',
        special_instructions: 'Get autograph',

        packages: [{ package: {tracking: 'info here'} }],
        shipment_items: { shipment_item: { product_key: 'SKU'} },

        ship_to: { country: 'US' }
      })
    end
  end
end
