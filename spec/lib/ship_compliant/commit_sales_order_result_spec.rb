require "spec_helper"

module ShipCompliant
  describe CommitSalesOrderResult do
    it_behaves_like "BaseResult"

    context "shipments" do
      it "returns the shipments as an array" do
        subject.shipments.should == [
          { key: 'SHIPMENT-KEY', is_committed: true }
        ]
      end
    end

    context "committed_shipments" do
      it "returns the shipment keys for committed shipments" do
        subject.committed_shipments.should == ['SHIPMENT-KEY']
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
