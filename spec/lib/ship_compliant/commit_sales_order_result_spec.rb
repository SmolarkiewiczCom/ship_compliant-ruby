require "spec_helper"

module ShipCompliant
  describe CommitSalesOrderResult do
    it_behaves_like "BaseResult"

    context "shipments" do
      it "returns the shipments as an array" do
        expect(subject.shipments).to eq([
          { key: 'SHIPMENT-KEY', is_committed: true }
        ])
      end
    end

    context "committed_shipments" do
      it "returns the shipment keys for committed shipments" do
        expect(subject.committed_shipments).to eq(['SHIPMENT-KEY'])
      end
    end

    subject do
      CommitSalesOrderResult.new({
        shipments: {
          shipment_commit_response: {
            key: "SHIPMENT-KEY",
            is_committed: true
          }
        }
      })
    end
  end
end
