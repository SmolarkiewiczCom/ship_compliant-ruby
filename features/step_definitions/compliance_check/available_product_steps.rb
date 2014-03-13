When(/^I check compliance with an available product$/) do
  VCR.use_cassette('compliance_available_product') do
    @compliance_status = ShipCompliant.client.call(:check_compliance_of_sales_order_with_address_validation, {
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
        'SalesOrderKey' => '1006891',
        'SalesTaxCollected' => 0,
        'Shipments' => {
          'Shipment' => {
            'Discounts' => nil,
            'FulfillmentHouse' => 'InHouse',
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
                  'ProductKey' => '04CHRCAB75',
                  'ProductQuantity' => 6,
                  'ProductUnitPrice' => 76
                }
              },
              {
                'ShipmentItem' => {
                  'BrandKey' => 'DEN',
                  'Discounts' => nil,
                  'ProductKey' => 'TShirt',
                  'ProductQuantity' => 1,
                  'ProductUnitPrice' => 25.99
                }
              }
            ],
            'ShipmentKey' => 1,
            'ShipmentStatus' => 'SentToFulfillment',
            'Shipping' => 15,
            'ShipTo' => {
              'City' => 'New York',
              'Company' => nil,
              'Country' => 'US',
              'County' => nil,
              'DateOfBirth' => DateTime.new(1987, 8, 6),
              'Email' => 'emily@six88.com',
              'Fax' => nil,
              'FirstName' => 'Emily',
              'LastName' => 'Sheehan',
              'Phone' => '7209375005',
              'State' => 'NY',
              'Street1' => '253 Broadway Ave',
              'Street2' => 'Floor 9',
              'Zip1' => 10007,
              'Zip2' => nil
            }
          }
        },
        'Tags' => nil
      }
    })
  end
end

Then(/^I should receive the sales tax rates$/) do
  pending
end

Then(/^I should receive the shipment compliance$/) do
  pending # express the regexp above with the code you wish you had
end
