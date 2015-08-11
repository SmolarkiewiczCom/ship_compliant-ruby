When(/^I check compliance with a non\-compliant product$/) do
  VCR.use_cassette('compliance_noncompliant_product') do
    @compliance_status = ShipCompliant::CheckCompliance.of_sales_order({
      'AddressOption' => {
        'IgnoreStreetLevelErrors' => true,
        'RejectIfAddressSuggested' => 'false'
      },
      'IncludeSalesTaxRates' => true,
      'PersistOption' => 'Null',
      'SalesOrder' => {
        'BillTo' => {
          'City' => 'Boulder',
          'Company' => 'ShipCompliant',
          'Country' => 'US',
          'DateOfBirth' => DateTime.new(1987, 8, 6),
          'Email' => 'emily@six88.com',
          'FirstName' => 'Emily',
          'LastName' => 'Sheehan',
          'Phone' => '303-996-1626',
          'State' => 'CO',
          'Street1' => '1877 Broadway St',
          'Street2' => 'SUITE 703',
          'Zip1' => 80304
        },
        'CustomerKey' => 'd23c963b',
        'Discounts' => nil,
        'FulfillmentType' => 'Daily',
        'OrderType' => 'Internet',
        'Payments' => nil,
        'PurchaseDate' => DateTime.new(2014, 3, 12),
        'RegisterId' => 'cf3ee9',
        'SalesOrderKey' => '1006898',
        'SalesTaxCollected' => 0,
        'Shipments' => {
          'Shipment' => {
            'Discounts' => nil,
            'FulfillmentHouse' => 'WineShipping',
            'Handling' => 0,
            'InsuredAmount' => 0,
            'LicenseRelationship' => 'Default',
            'Packages' => nil,
            'ShipDate' => DateTime.new(2014, 3, 15),
            'ShippingService' => 'UPS',
            'ShipmentItems' => [
              {
                'ShipmentItem' => {
                  'BrandKey' => 'DEN',
                  'Discounts' => nil,
                  'ProductKey' => '09OTBC75',
                  'ProductQuantity' => 2,
                  'ProductUnitPrice' => 15.99
                }
              },
              {
                'ShipmentItem' => {
                  'BrandKey' => 'DEN',
                  'Discounts' => nil,
                  'ProductKey' => 'SNFL13',
                  'ProductQuantity' => 2,
                  'ProductUnitPrice' => 22.99
                }
              }
            ],
            'ShipmentKey' => 1,
            'ShipmentStatus' => 'SentToFulfillment',
            'Shipping' => 15,
            'ShipTo' => {
              'City' => 'Meridian',
              'Company' => 'SMITH HOUSING',
              'Country' => 'US',
              'DateOfBirth' => DateTime.new(1987, 1, 1),
              'Email' => 'bob.smith@smith.com',
              'FirstName' => 'J Robert',
              'LastName' => 'Love',
              'Phone' => '770-551-0007',
              'State' => 'ID',
              'Street1' => '405 E Fairview Ave',
              'Zip1' => 83642,
            }
          }
        },
        'Tags' => nil
      }
    })
  end
end

Then(/^I should receive error messages$/) do
  @compliance_status.compliant?.should be_falsey
  shipment = @compliance_status.compliance_rules_for_shipment('1')
  errors = shipment.rules.select { |r| !r.compliant? }

  errors.map(&:rule_description).should == [
    'Shipments to this region require an excise tax of $.45 per 1 gallon on offsite sales of wine due within 20 days after every month. For a summary of the taxes in the state, click here.',
    'Shipments to this region for offsite sales require the following shipping label: Alcoholic Beverages - Cannot deliver to intoxicated persons.',
    'Shipments to this region require sales tax for offsite sales shipments. For a summary of the taxes in the state, click here.',
    'Shipments to this region have a per customer volume limit of 24 cases per individual per calendar year. The volume will be calculated from combined onsite and offsite sales.',
    'A license is required for shipping offsite sales and must be renewed every 1 year. The cost of this license is $50.00. Note: Renewal fee is $25..',
    'Suppliers shipping to this region must submit reporting data for offsite sales due within 1 month after every year. This region requires a periodic report even if no shipments have been made. The following information should be included within the report:  ShipTo Name, ShipTo Address, BillTo Name, Type of Product (Eg: Wine, Sparkling Wine..), Volume of Product, Unit Price, Date of Purchase, Date of Shipment, Invoice Number. .',
    'Only wines of your own production or bottling are allowed to be shipped to this region. Note: Authorized direct shipping includes "sales by a winery of wine produced or bottled by the winery."..'
  ]
end
