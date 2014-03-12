When(/^I add a new product with invalid brand$/) do
  VCR.use_cassette('product_invalid_brand') do
    @product_response = ShipCompliant::AddUpdateProduct.product({
      bottle_size_ms: 750,
      brand_key: 'DENSNW',
      default_case: 12,
      default_wholesale_case_price: 270,
      description: 'Denver Snow Flake Cab 2013',
      percent_alcohol: 14.1,
      product_distribution: 'Both',
      product_key: 'SNFL13',
      product_type: 'Wine',
      unit_price: 49.99,
      varietal: 'Cabernet Sauvignon',
      vintage: 2013,
      volume_amount: 750,
      volume_unit: 'milliliter'
    }, update_mode: 'ErrorOnExisting')
  end
end

When(/^I add a new product$/) do
  VCR.use_cassette('product_valid_brand') do
    @product_response = ShipCompliant::AddUpdateProduct.product({
      bottle_size_ms: 750,
      brand_key: 'DEN',
      default_case: 12,
      default_wholesale_case_price: 270,
      description: 'Denver Snow Flake Cab 2013',
      percent_alcohol: 14.1,
      product_distribution: 'Both',
      product_key: 'SNFL13',
      product_type: 'Wine',
      unit_price: 49.99,
      varietal: 'Cabernet Sauvignon',
      vintage: 2013,
      volume_amount: 750,
      volume_unit: 'milliliter'
    }, update_mode: 'ErrorOnExisting')
  end
end

When(/^I add a product that already exists$/) do
  VCR.use_cassette('product_already_exists') do
    @product_response = ShipCompliant::AddUpdateProduct.product({
      bottle_size_ms: 750,
      brand_key: 'DEN',
      default_case: 12,
      default_wholesale_case_price: 270,
      description: 'Denver Snow Flake Cab 2013',
      percent_alcohol: 14.1,
      product_distribution: 'Both',
      product_key: 'SNFL13',
      product_type: 'Wine',
      unit_price: 49.99,
      varietal: 'Cabernet Sauvignon',
      vintage: 2013,
      volume_amount: 750,
      volume_unit: 'milliliter'
    }, update_mode: 'ErrorOnExisting')
  end
end

When(/^I update a product$/) do
  VCR.use_cassette('update_product') do
    @product_response = ShipCompliant::AddUpdateProduct.product({
      bottle_size_ms: 750,
      brand_key: 'DEN',
      default_case: 12,
      default_wholesale_case_price: 270,
      description: 'Denver Snow Flake Cab 2013',
      percent_alcohol: 14.1,
      product_distribution: 'Both',
      product_key: 'SNFL13',
      product_type: 'Wine',
      unit_price: 49.99,
      varietal: 'Cabernet Sauvignon',
      vintage: 2013,
      volume_amount: 750,
      volume_unit: 'milliliter'
    }, update_mode: 'UpdateExisting')
  end
end

When(/^I ignore existing product on update$/) do
  VCR.use_cassette('ignore_existing_product') do
    @product_response = ShipCompliant::AddUpdateProduct.product({
      bottle_size_ms: 750,
      brand_key: 'DEN',
      default_case: 12,
      default_wholesale_case_price: 270,
      description: 'Denver Snow Flake Cab 2013',
      percent_alcohol: 14.1,
      product_distribution: 'Both',
      product_key: 'SNFL13',
      product_type: 'Wine',
      unit_price: 49.99,
      varietal: 'Cabernet Sauvignon',
      vintage: 2013,
      volume_amount: 750,
      volume_unit: 'milliliter'
    }, update_mode: 'IgnoreExisting')
  end
end

Then(/^I should get an error message for the missing brand$/) do
  @product_response.error_message.should == "Brand does not exist [DENSNW]."
end

Then(/^the product should have been created$/) do
  @product_response.success?.should be_true
end

Then(/^I should get an error for already defined product$/) do
  @product_response.error_message.should == "Product already exists."
end

Then(/^I should get a message that the product was updated$/) do
  @product_response.success?.should be_true
end
