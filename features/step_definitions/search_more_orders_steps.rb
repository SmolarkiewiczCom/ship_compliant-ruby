When(/^I search for second page$/) do
  VCR.use_cassette('sales_order_more') do
    @orders_result = ShipCompliant::SearchMoreSalesOrders.paging_cookie('33d2c6d7-212c-46fd-9712-d4a5ca1f4f2f')
  end
end

When(/^I search with invalid paging cookie$/) do
  VCR.use_cassette('search_more_orders_invalid_cookie') do
    @orders_result = ShipCompliant::SearchMoreSalesOrders.paging_cookie('invalid-cookie')
  end
end

Then(/^I should have orders$/) do
  @orders_result.success?.should be_truthy
  @orders_result.length.should == 100
end

Then(/^I should receive an invalid cookie error$/) do
  @orders_result.failure?.should be_truthy
  error = @orders_result.errors.first

  error.message.should == 'PagingCookie was not found [00000000-0000-0000-0000-000000000000].'
  error.code.should == 236
end
