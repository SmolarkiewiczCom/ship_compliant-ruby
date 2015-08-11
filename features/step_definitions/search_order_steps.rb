When(/^I search for orders by purchase date$/) do
  VCR.use_cassette('search_sales_orders') do
    @search_results = ShipCompliant::SearchSalesOrders.find_by({
      purchase_date_min: DateTime.new(2014, 3, 10),
      purchase_date_max: DateTime.new(2014, 3, 12)
    })
  end
end

When(/^I search with invalid criteria$/) do
  VCR.use_cassette('invalid_search_sales_orders') do
    @search_results = ShipCompliant::SearchSalesOrders.find_by({})
  end
end

Then(/^I should receive a success status for search$/) do
  @search_results.success?.should be_truthy
end

Then(/^I should have paging cookie information$/) do
  @search_results.paging_cookie.should == '3087b638-5c60-42ba-91b2-5eae589e553a'
  @search_results.paging_cookie_expires.should == DateTime.new(2014, 3, 11, 21, 45, 22.3330533, '-05')
end

Then(/^I should get an error status for search$/) do
  @search_results.failure?.should be_truthy
  @search_results.error_count.should == 1
  
  error = @search_results.errors.first
  error.message.should == "SalesOrder search must include at least one of the following criteria: SalesOrderKeys array, SalesOrderKeyMin/SalesOrderKeyMax, ShipDateMin/ShipDateMax, PurchaseDateMin/PurchaseDateMax, RequestedShipDateMin/RequestedShipDateMax, ExternalSalesOrderKeys array, ExternalSalesOrderKeyMin/ExternalSalesOrderKeyMax, ExternalClubKey, ExternalOfferKey, SettlementBatchNumber."
  error.code.should == 238
end

Then(/^I should find two orders$/) do
  @search_results.length.should == 2

  # extract orders from array
  order_1, order_2 = @search_results.summaries

  # Purchase Dates
  order_1.purchase_date.should == DateTime.new(2014, 3, 10)
  order_2.purchase_date.should == DateTime.new(2014, 3, 11)

  # Sales Order Keys
  order_1.order_key.should == 'ONL-1'
  order_2.order_key.should == 'ONS-45'

  # Order 1 Shipments
  order_1.shipment_summary.should == {
    compliance_status: 'LegacyCommitted',
    fulfillment_exception_reason: nil,
    fulfillment_exception_type: 'NonCompliant',
    fulfillment_house: 'AbbeyWineWarehouse',
    fulfillment_status: 'Exception',
    packages: nil,
    requested_ship_date: DateTime.new(2014, 3, 11),
    ship_date: DateTime.new(2014, 3, 11),
    shipment_key: 0,
    shipment_status: 'SentToFulfillment',

    ship_to: {
      first_name: 'John',
      last_name: 'Doe',
      zip1: 90210
    }
  }

  # Order 2 Shipments
  order_2.shipment_summary.should == {
    compliance_status: 'LegacyCommitted',
    fulfillment_exception_reason: nil,
    fulfillment_exception_type: 'NonCompliant',
    fulfillment_house: 'AeroPacking',
    fulfillment_status: 'Exception',
    packages: nil,
    requested_ship_date: DateTime.new(2014, 3, 12),
    ship_date: DateTime.new(2014, 3, 12),
    shipment_key: 0,
    shipment_status: 'SentToFulfillment',

    ship_to: {
      first_name: 'John',
      last_name: 'Doe',
      zip1: 90210
    }
  }
end
