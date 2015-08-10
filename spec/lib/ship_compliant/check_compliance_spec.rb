require "spec_helper"

module ShipCompliant
  describe CheckCompliance do

    before { savon.mock! }
    after { savon.unmock! }

    context "of_sales_order" do
      let(:message) do
        {
          'Request' => {
            'Security' => {
              'PartnerKey' => 'abc-123',
              'Username' => 'bob@example.com',
              'Password' => 'secret'
            },
            'IncludeSalesTax' => true,
            'CustomerKey' => 'CUST-1',
            'FooBar' => {
              'Baz' => false
            }
          }
        }
      end
      let(:response) { File.read('spec/fixtures/check_compliance.xml') }

      it "queries the client with product information" do
        savon.expects(:check_compliance_of_sales_order_with_address_validation)
          .with(message: message).returns(response)

        result = CheckCompliance.of_sales_order({
          include_sales_tax: true,
          customer_key: 'CUST-1',
          foo_bar: { baz: false }
        })

        expect(result).to be_kind_of(CheckComplianceResult)
      end
    end

  end
end
