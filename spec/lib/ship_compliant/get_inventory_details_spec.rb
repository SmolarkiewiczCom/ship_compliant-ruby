require "spec_helper"

module ShipCompliant

  describe GetInventoryDetails do

    before { savon.mock! }
    after { savon.unmock! }

    it "gets inventory details" do
      message = {
        'Request' => {
          'Security' => {
            'PartnerKey' => 'abc-123',
            'Username' => 'bob@example.com',
            'Password' => 'secret'
          },
          'BrandKey' => 'BRAND-KEY',
          'FulfillmentLocation' => 'FULFILLMENT-LOCATION',
        }
      }

      savon.expects(:get_inventory_details)
        .with(message: message)
        .returns(File.read('spec/fixtures/void_order_success.xml'))

      result = GetInventoryDetails.call(query: {
        brand_key: 'BRAND-KEY',
        fulfillment_location: 'FULFILLMENT-LOCATION'
      })

      expect(result).to be_kind_of(GetInventoryDetailsResult)
    end
  end
end
