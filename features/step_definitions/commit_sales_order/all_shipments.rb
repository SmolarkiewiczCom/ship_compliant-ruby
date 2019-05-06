When(/^I commit a sale with all shipments$/) do
  VCR.use_cassette('commit_salesorder_all_shipments') do
    @order_commit_result = ShipCompliant::CommitSalesOrder.call({
      commit_options: 'AllShipments',
      payments: nil,
      sales_tax_collected: 0,
      sales_order_key: '1006932'
    })
  end
end

Then(/^I get a successful commit message$/) do
  @order_commit_result.success?.should be_truthy
  @order_commit_result.committed_shipments.should == ['1']
end
