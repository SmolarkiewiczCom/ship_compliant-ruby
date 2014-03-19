When(/^I get inventory details with everthing$/) do
  VCR.use_cassette('inventory_details_for_everything') do
    @inventory_results = ShipCompliant::GetInventoryDetails.call({
      brand_key: 'DEN',
      fulfillment_location: 'WineShipping',
      inventory_type: 'All',
      product_key: '04CHRCAB75'
    })
  end
end

Then(/^I should be able to get the product information$/) do
  @inventory_results.products_for_location('WineShipping').should be_kind_of(Array)
  @inventory_results.products_for_location('WineShipping').length.should == 1
  product = @inventory_results.products_for_location('WineShipping').first

  product.default_case.should == '12x750 mL'
  product.description.should == 'Capital Hill Reserve Cabernet'
  product.fulfillment_sku.should == '04CHRCAB75'
  product.percent_alcohol.should == 13
  product.product_key.should == '04CHRCAB75'
  product.product_type.should == 'Wine'
  product.unit_price.should == 0
  product.vintage.should == 2011
  product.volume_amount.should == 750
  product.volume_ml.should == 750
  product.volume_unit.should == 'Milliliter'
end

Then(/^I should inventory levels for a product$/) do
  product = @inventory_results.products_for_location('WineShipping').first
  product.inventory_levels.should == {
    available: 25,
    reserved: 25
  }
end
