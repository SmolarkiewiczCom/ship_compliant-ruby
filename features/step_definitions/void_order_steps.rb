When(/^I void an order$/) do
  VCR.use_cassette('void_order') do
    @voided_order = ShipCompliant::VoidSalesOrder.by_order_key('ONS-1')
  end
end

When(/^I void an already void order$/) do
  VCR.use_cassette('void_voided_order') do
    @voided_order = ShipCompliant::VoidSalesOrder.by_order_key('ONS-1')
  end
end

Then(/^I should get a successful response$/) do
  @voided_order.success?.should be_true
end

Then(/^I should get an error message$/) do
  @voided_order.should == {
    response_status: 'Failure',
    errors: {
      error: {
        code: '200',
        key: 'ONS-1',
        message: 'SalesOrder does not exist [ONS-1].',
        target: 'SalesOrder',
        type: 'Validation'
      }
    }
  }
end
