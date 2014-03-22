require "spec_helper"

module ShipCompliant
  describe AddUpdateBrand do

    before { savon.mock! }
    after { savon.unmock! }

    let(:message) do
      {
        'Request' => {
          'Security' => {
            'PartnerKey' => 'abc-123',
            'Username' => 'bob@example.com',
            'Password' => 'secret'
          },
          'Brand' => {
            'Key' => 'WNDFL',
            'Name' => 'Wonderful',
            'Owner' => {
              'Name' => 'Sam'
            }
          },
          'UpdateMode' => 'DoWackaDo'
        }
      }
    end
    let(:response) { File.read('spec/fixtures/add_update_product.xml') }
    context "brand" do

      it "queries the client with an update mode" do
        savon.expects(:add_update_brand)
          .with(message: message).returns(response)

        result = AddUpdateBrand.brand({
          key: 'WNDFL',
          name: 'Wonderful',
          owner: { name: 'Sam' }
        }, update_mode: 'DoWackaDo')

        result.should be_kind_of(AddUpdateBrandResult)
      end

      it "update mode defaults to ErrorOnExisting" do
        message['Request']['UpdateMode'] = 'ErrorOnExisting'
        savon.expects(:add_update_brand)
          .with(message: message).returns(response)

        AddUpdateBrand.brand({
          key: 'WNDFL',
          name: 'Wonderful',
          owner: { name: 'Sam' }
        })
      end
    end

  end
end
