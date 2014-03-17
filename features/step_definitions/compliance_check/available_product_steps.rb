When(/^I check compliance with an available product$/) do
  VCR.use_cassette('compliance_available_product') do
    @compliance_status = ShipCompliant::CheckCompliance.of_sales_order({
      address_option: {
        ignore_street_level_errors: true,
        reject_if_address_suggested: 'false'
      },
      include_sales_tax_rates: true,
      persist_option: 'Null',
      sales_order: {
        bill_to: {
          city: 'Boulder',
          company: 'ShipCompliant',
          country: 'US',
          date_of_birth: DateTime.new(1987, 8, 6),
          email: 'emiliy@six88.com',
          first_name: 'Emily',
          last_name: 'Sheehan',
          phone: '303-996-1626',
          state: 'CO',
          street1: '1877 Broadway St',
          street2: 'SUITE 703',
          zip1: 80304
        },
        customer_key: 'd23c963b',
        discounts: nil,
        fulfillment_type: 'Daily',
        order_type: 'Internet',
        payments: nil,
        purchase_date: DateTime.new(2014, 3, 12),
        register_id: 'cf3ee9',
        sales_order_key: '1006891',
        sales_tax_collected: 0,
        shipments: {
          shipment: {
            discounts: nil,
            fulfillment_house: 'InHouse',
            handling: 0,
            insured_amount: 0,
            license_relationship: 'Default',
            packages: nil,
            ship_date: DateTime.new(2014, 3, 15),
            shipping_service: 'UPS',
            shipment_items: [
              {
                shipment_item: {
                  brand_key: 'DEN',
                  discounts: nil,
                  product_key: '04CHRCAB75',
                  product_quantity: 6,
                  product_unit_price: 76
                }
              },
              {
                shipment_item: {
                  brand_key: 'DEN',
                  discounts: nil,
                  product_key: 'TShirt',
                  product_quantity: 1,
                  product_unit_price: 25.99
                }
              }
            ],
            shipment_key: 1,
            shipment_status: 'SentToFulfillment',
            shipping: 15,
            ship_to: {
              city: 'New York',
              company: nil,
              country: 'US',
              county: nil,
              date_of_birth: DateTime.new(1987, 8, 6),
              email: 'emily@six88.com',
              fax: nil,
              first_name: 'Emily',
              last_name: 'Sheehan',
              phone: '7209375005',
              state: 'NY',
              street1: '253 Broadway Ave',
              street2: 'Floor 9',
              zip1: 10007,
              zip2: nil
            }
          }
        },
        tags: nil
      }
    })
  end
end

Then(/^I should receive the sales tax rates$/) do
  @compliance_status.success?.should be_true
  @compliance_status.compliant?.should be_true

  # Tax Rates
  @compliance_status.recommended_tax_due.should == 44.1
  @compliance_status.shipment_sales_tax_rates.should be_kind_of(Array)
  shipment_taxes = @compliance_status.taxes_for_shipment('1')

  # Freight Taxes
  shipment_taxes.freight.sales_tax_due.should == 1.33125
  shipment_taxes.freight.sales_tax_rate.should == 8.875

  # Product Taxes
  shipment_taxes.taxes_for_product('04CHRCAB75').sales_tax_due.should == 40.47
  shipment_taxes.taxes_for_product('04CHRCAB75').sales_tax_rate.should == 8.875

  shipment_taxes.taxes_for_product('TShirt').sales_tax_due.should == 2.30661
  shipment_taxes.taxes_for_product('TShirt').sales_tax_rate.should == 8.875
end

Then(/^I should receive the shipment compliance results$/) do
  shipment_compliance = @compliance_status.compliance_rules_for_shipment('1')
  shipment_compliance.compliant?.should be_true
  shipment_compliance.shipment_key.should == '1'

  shipment_compliance.rules.length.should == 6

  # Compliance Descriptions
  compliance_descriptions = shipment_compliance.rules.map { |c| c.compliance_description }
  compliance_descriptions.should == [
    'No prohibited products in shipment.',
    'You have 1 current license in this region for the time of this shipment.',
    'Rule has been acknowledged.',
    'Rule has been acknowledged.',
    'All products within this shipment belong to self-produced brands.',
    'You have shipped 1.00 cases to this individual between 1/1/2014 and 12/31/2014 and thus are under the customer aggregate volume limit of 36 cases per calendar year.'
  ]

  # Rule Descriptions
  rule_descriptions = shipment_compliance.rules.map { |c| c.rule_description }
  rule_descriptions.should == [
    'Some Products are always non-compliant.',
    'A license is required for shipping offsite sales and must be renewed every 1 year. The cost of this license is $125.00.',
    'Shipments to this region require an excise tax of $.30 per 1 gallon on offsite sales of wine less than or equal to 24% alcohol due within 20 days after every month. For a summary of the taxes in the state, click here.',
    'Shipments to this region require sales tax for offsite sales shipments. For a summary of the taxes in the state, click here.',
    'Only wines of your own production are allowed to be shipped to this region. Note: The license holder must produce the wine being shipped..',
    'Shipments to this region have a per customer volume limit of 36 cases per individual per calendar year. The volume will be calculated from combined onsite and offsite sales.'
  ]
end

Then(/^I should receive the suggested address$/) do
  @compliance_status.address_validation_result.should == 'ValidatedWithStreetLevelNormalization'
  address = @compliance_status.suggested_address
  
  address.city.should == 'New York'
  address.county.should == 'New York'
  address.state.should == 'NY'
  address.street1.should == '253 Broadway'
  address.street2.should == 'Fl 9'
  address.zip1.should == 10007
  address.zip2.should == 2326

  address.details.should == {
    city_abbreviation: 'New York',
    congressional_district: '10',
    county_fips: '36061',
    time_zone: 'Eastern Time',
    time_zone_code: '05'
  }

  address.parts.should == {
    company: nil,
    mail_box_name: nil,
    mail_box_number: nil,
    post_direction: nil,
    pre_direction: nil,
    street_name: 'Broadway',
    street_number: '253',
    street_suffix: nil,
    suite_name: 'Fl',
    suite_number: '9'
  }
end
