When(/^I commit a sale with all shipments$/) do
  VCR.use_cassette('commit_salesorder_all_shipments') do
    @compliance_status = ShipCompliant.client.call(:commit_sales_order, {
      'CommitOption' => 'AllShipments',
      'Payments' => nil,
      'SalesTaxCollected' => 0,
      'SalesOrderKey' => '1006932'
    })
  end
end

Then(/^I get a successful commit message$/) do
  pending
end
