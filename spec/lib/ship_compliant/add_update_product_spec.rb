require "spec_helper"

module ShipCompliant
  describe AddUpdateProduct do

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
          'Product' => {
            'BottleSizeML' => 123,
            'DefaultWholesaleCasePrice' => 150
          },
          'UpdateMode' => 'DoWackaDo'
        }
      }
    end

    context "product" do
      it "queries the client with product and update mode" do
        savon.expects(:add_update_product)
          .with(message: message).returns('')
        
        AddUpdateProduct.product({
          bottle_size_ml: 123,
          default_wholesale_case_price: 150
        }, update_mode: 'DoWackaDo')
      end

      it "update mode defaults to ErrorOnExisting" do
        message['Request']['UpdateMode'] = 'ErrorOnExisting'
        savon.expects(:add_update_product)
          .with(message: message).returns('')
        
        AddUpdateProduct.product({
          bottle_size_ml: 123,
          default_wholesale_case_price: 150
        })
      end
    end

  end
end
