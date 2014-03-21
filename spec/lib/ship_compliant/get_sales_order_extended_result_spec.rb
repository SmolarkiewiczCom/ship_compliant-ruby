require "spec_helper"

module ShipCompliant
  describe GetSalesOrderExtendedResult do
    it_behaves_like "BaseResult"

    context "shipment_compliance_rules" do
      it "returns compliance rules as an array" do
        subject.shipment_compliance_rules.should == [
          {
            is_compliant: true,
            key: 'SHIPMENT-KEY',
          }
        ]
      end
    end

    context "compliance_rules_for_shipment" do
      it "finds compliance rules for shipment" do
        subject.compliance_rules_for_shipment('SHIPMENT-KEY').should == ShipmentCompliance.new({
          is_compliant: true,
          key: 'SHIPMENT-KEY'
        })
      end
    end

    context "bill_to" do
      it "returns an Address" do
        subject.bill_to.should == Address.new({
          city: 'Jellystone Park',
          state: 'WY'
        })
      end
    end

    context "shipments" do
      it "returns an array of shipments" do
        subject.shipments.should == [{
          shipment_key: 'SHIPMENT-KEY',
          shipment_items: []
        }]
      end
    end

    context "find_shipment" do
      it "returns the shipment" do
        subject.find_shipment('SHIPMENT-KEY').should == Shipment.new({
          shipment_key: 'SHIPMENT-KEY',
          shipment_items: []
        })
      end
    end

    subject do
      GetSalesOrderExtendedResult.new({
        compliance_results: {
          sales_order: {
            shipments: {shipment_compliance_response: [{ is_compliant: true, key: 'SHIPMENT-KEY' }]}
          }
        },
        sales_order: {
          bill_to: {
            city: 'Jellystone Park',
            state: 'WY'
          },
          shipments: [shipment]
        }
      })
    end

    let(:shipment) do
      {shipment: { shipment_key: 'SHIPMENT-KEY', shipment_items: [] }}
    end
  end
end
