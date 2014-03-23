When(/^I (create|update|ignore) a (?:new\s)?brand$/) do |action|
  key = 'HCAS'
  update_mode = 'ErrorOnExisting'

  case action
  when 'update'
    key = 'HCAN'
    update_mode = 'UpdateExisting'
  when 'ignore'
    update_mode = 'IgnoreExisting'
  end

  @brand_result = ShipCompliant::AddUpdateBrand.brand({
    key: key,
    name: 'Hiccups Anonymous',
    owner: {
      city: 'Ye Old Brew Port',
      country: 'US',
      name: 'John Doe',
      state: 'LA',
      street1: '1337 Drunken Ave.',
      zip: 84742
    },

    this_brand_is_bottled_by_a_third_party: false,
    this_brand_is_produced_by_a_third_party: false,
    this_brand_operates_under_a_trade_name: true,
    this_brand_was_acquired_from_a_third_party: false
  }, update_mode: update_mode)
end

When(/^I add a new brand$/) do
  VCR.use_cassette('brand_valid') do
    step "I create a brand"
  end
end

When(/^I add a brand that already exists$/) do
  VCR.use_cassette('brand_already_exists') do
    step "I create a new brand"
  end
end

When(/^I update an existing brand$/) do
  VCR.use_cassette('brand_update_existing') do
    step "I update a brand"
  end
end

When(/^I ignore existing brand on update$/) do
  VCR.use_cassette('brand_ignore_existing') do
    step "I ignore a new brand"
  end
end

Then(/^I should get an error for already defined brand$/) do
  @brand_result.failure?.should be_true
  @brand_result.errors.length.should == 1
  error = @brand_result.errors.first
  
  error.code.should == 705
  error.key.should == 'HCAS'
  error.message.should == 'BrandKey  exists.'
  error.type.should == 'Validation'
end

Then(/^the brand should have been updated$/) do
  @brand_result.success?.should be_true
end

Then(/^the brand should have been created$/) do
  @brand_result.success?.should be_true
end
