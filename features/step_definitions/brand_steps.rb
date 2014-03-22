When(/^I add a new brand$/) do
  VCR.use_cassette('add_brand') do
    @brand_result = ShipCompliant::AddUpdateBrand.brand({
      key: 'HCAS',
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
    })
  end
end

Then(/^the brand should have been created$/) do
  @brand_result.success?.should be_true
end
