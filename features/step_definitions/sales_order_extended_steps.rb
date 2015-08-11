When(/^I search for order information$/) do
  VCR.use_cassette('sales_order_extended') do
    @order_result = ShipCompliant::GetSalesOrderExtended.by_order_key('1006890')
  end
end

When(/^I search for an invalid order$/) do
  VCR.use_cassette('sales_order_missing') do
    @order_result = ShipCompliant::GetSalesOrderExtended.by_order_key('order-404')
  end
end

Then(/^I should receive shipment compliance statuses$/) do
  shipment_compliance = @order_result.compliance_rules_for_shipment('1')
  shipment_compliance.compliant?.should be_truthy
  shipment_compliance.rules.should == []
end

Then(/^I should receive billing information$/) do
  billing = @order_result.bill_to
  billing.should be_kind_of(ShipCompliant::Address)

  billing.city.should == 'St. Paul'
  billing.company.should == 'SMITH HOUSING'
  billing.country.should == 'US'
  billing.county.should be_nil
  billing.date_of_birth.should == DateTime.new(1987, 1, 1)
  billing.email.should == 'bob.smith@smith.com'
  billing.fax.should be_nil
  billing.first_name.should == 'J Robert'
  billing.last_name.should == 'Love'
  billing.phone.should == '(770) 551-0007'
  billing.state.should == 'MN'
  billing.street1.should == '444 Cedar Street'
  billing.street2.should be_nil
  billing.zip1.should == 55101
  billing.zip2.should be_nil
end

Then(/^I should receive shipment information$/) do
  shipment = @order_result.find_shipment('1')
  
  shipment.fulfillment_house.should == 'WineShipping'
  shipment.fulfillment_exception_reason.should be_nil
  shipment.fulfillment_exception_type.should == 'None'
  shipment.fulfillment_status.should == 'Accepted'

  shipment.handling.should == 0
  shipment.insured_amount.should == 0
  shipment.shipping.should == 30

  shipment.ship_date.should == DateTime.new(2014, 2, 20, 20, 6)
  shipment.shipment_status.should == 'Delivered'
  shipment.shipping_service.should == 'UP2'
  shipment.special_instructions.should be_nil
  
  # Shipment Packages
  package = shipment.packages.first
  package.tracking_number.should == '1Z875F62A890362872'
  package.tracking_status.should == 'Delivered'

  # Ship To Address
  shipment.ship_to.should be_kind_of(ShipCompliant::Address)
end

Then(/^I should receive order channel details$/) do
  details = @order_result.channel_details
  details.order_channel.should == 'MyOrders'
end

Then(/^I should receive an error that the order doesn't exist$/) do
  @order_result.failure?.should be_truthy
  error = @order_result.errors.first

  error.code.should == 200
  error.message.should == 'SalesOrder does not exist [order-404].'
  error.target.should == 'Null'
  error.type.should == 'Validation'
end
