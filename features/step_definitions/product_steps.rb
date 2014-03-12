When(/^I add a new product with invalid brand$/) do
  VCR.use_cassette('product_invalid_brand') do
    @product_response = ShipCompliant.client.call(:add_update_product, {
      'Product' => {
        'BottleSizeMS' => 750,
        'BrandKey' => 'DENSNW',
        'DefaultCase' => 12,
        'DefaultWholesaleCasePrice' => 270,
        'Description' => 'Denver Snow Flake Cab 2013',
        'PercentAlcohol' => 14.1,
        'ProductDistribution' => 'Both',
        'ProductKey' => 'SNFL13',
        'ProductType' => 'Wine',
        'UnitPrice' => 49.99,
        'Varietal' => 'Cabernet Sauvignon',
        'Vintage' => 2013,
        'VolumeAmount' => 750,
        'VolumeUnit' => 'milliliter'
      },
      'UpdateMode' => 'ErrorOnExisting'
    })
  end
end

When(/^I add a new product$/) do
  VCR.use_cassette('product_valid_brand') do
    @product_response = ShipCompliant.client.call(:add_update_product, {
      'Product' => {
        'BottleSizeMS' => 750,
        'BrandKey' => 'DEN',
        'DefaultCase' => 12,
        'DefaultWholesaleCasePrice' => 270,
        'Description' => 'Denver Snow Flake Cab 2013',
        'PercentAlcohol' => 14.1,
        'ProductDistribution' => 'Both',
        'ProductKey' => 'SNFL13',
        'ProductType' => 'Wine',
        'UnitPrice' => 49.99,
        'Varietal' => 'Cabernet Sauvignon',
        'Vintage' => 2013,
        'VolumeAmount' => 750,
        'VolumeUnit' => 'milliliter'
      },
      'UpdateMode' => 'ErrorOnExisting'
    })
  end
end

When(/^I add a product that already exists$/) do
  VCR.use_cassette('product_already_exists') do
    @product_response = ShipCompliant.client.call(:add_update_product, {
      'Product' => {
        'BottleSizeMS' => 750,
        'BrandKey' => 'DEN',
        'DefaultCase' => 12,
        'DefaultWholesaleCasePrice' => 270,
        'Description' => 'Denver Snow Flake Cab 2013',
        'PercentAlcohol' => 14.1,
        'ProductDistribution' => 'Both',
        'ProductKey' => 'SNFL13',
        'ProductType' => 'Wine',
        'UnitPrice' => 49.99,
        'Varietal' => 'Cabernet Sauvignon',
        'Vintage' => 2013,
        'VolumeAmount' => 750,
        'VolumeUnit' => 'milliliter'
      },
      'UpdateMode' => 'ErrorOnExisting'
    })
  end
end

When(/^I update a product$/) do
  VCR.use_cassette('update_product') do
    @product_response = ShipCompliant.client.call(:add_update_product, {
      'Product' => {
        'BottleSizeMS' => 750,
        'BrandKey' => 'DEN',
        'DefaultCase' => 12,
        'DefaultWholesaleCasePrice' => 270,
        'Description' => 'Denver Snow Flake Cab 2012',
        'PercentAlcohol' => 14.1,
        'ProductDistribution' => 'Both',
        'ProductKey' => 'SNFL13',
        'ProductType' => 'Wine',
        'UnitPrice' => 49.99,
        'Varietal' => 'Cabernet Sauvignon',
        'Vintage' => 2012,
        'VolumeAmount' => 750,
        'VolumeUnit' => 'milliliter'
      },
      'UpdateMode' => 'UpdateExisting'
    })
  end
end

When(/^I ignore existing product on update$/) do
  VCR.use_cassette('ignore_existing_product') do
    @product_response = ShipCompliant.client.call(:add_update_product, {
      'Product' => {
        'BottleSizeMS' => 750,
        'BrandKey' => 'DEN',
        'DefaultCase' => 12,
        'DefaultWholesaleCasePrice' => 270,
        'Description' => 'Denver Snow Flake Cab 2012',
        'PercentAlcohol' => 14.1,
        'ProductDistribution' => 'Both',
        'ProductKey' => 'SNFL13',
        'ProductType' => 'Wine',
        'UnitPrice' => 19.99,
        'Varietal' => 'Cabernet Sauvignon',
        'Vintage' => 2012,
        'VolumeAmount' => 750,
        'VolumeUnit' => 'milliliter'
      },
      'UpdateMode' => 'IgnoreExisting'
    })
  end
end

Then(/^I should get an error message for the missing brand$/) do
  product_response[:errors][:error][:message].should == "Brand does not exist [DENSNW]."
end

Then(/^the product should have been created$/) do
  product_response.should == {response_status: "Success"}
end

Then(/^I should get an error for already defined product$/) do
  product_response[:errors][:error][:message].should == "Product already exists."
end

Then(/^I should get a message that the product was updated$/) do
  product_response.should == {response_status: "Success"}
end

def product_response
  @product_response.to_hash[:add_update_product_response][:add_update_product_result]
end
