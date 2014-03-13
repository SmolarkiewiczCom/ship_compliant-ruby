When(/^I check compliance with a compliant order$/) do
  VCR.use_cassette('compliance_valid_order') do
    @compliance_status = ShipCompliant.client.call(:check_compliance_of_sales_order_with_address_validation, {
      'AddressOption' => {
        'IgnoreStreetLevelErrors' => true,
        'RejectIfAddressSuggested' => 'false'
      },
      'IncludeSalesTaxRates' => true,
      'PersistOption' => 'Null',
      'SalesOrder' => {
        'BillTo' => {
          'City' => 'St. Paul',
          'Company' => 'SMITH HOUSING',
          'Country' => 'US',
          'DateOfBirth' => DateTime.new(1987, 1, 1),
          'Email' => 'bob.smith@smith.com',
          'FirstName' => 'J Robert Jr.',
          'LastName' => 'Love',
          'Phone' => '770-551-0007',
          'State' => 'MN',
          'Street1' => '444 Cedar Street',
          'Zip1' => 55101,
        },
        'CustomerKey' => 'd23c963b',
        'Discounts' => nil,
        'FulfillmentType' => 'Daily',
        'OrderType' => 'Internet',
        'Payments' => nil,
        'PurchaseDate' => DateTime.new(2014, 3, 12),
        'RegisterId' => 'cf3ee9',
        'SalesOrderKey' => '1006932',
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
                  'ProductQuantity' => 12,
                  'ProductUnitPrice' => 15.99
                }
              },
              {
                'ShipmentItem' => {
                  'BrandKey' => 'DEN',
                  'Discounts' => nil,
                  'ProductKey' => 'SNFL13',
                  'ProductQuantity' => 12,
                  'ProductUnitPrice' => 22.99
                }
              }
            ],
            'ShipmentKey' => 1,
            'ShipmentStatus' => 'SentToFulfillment',
            'Shipping' => 30,
            'ShipTo' => {
              'City' => 'St. Paul',
              'Company' => 'SMITH HOUSING',
              'Country' => 'US',
              'DateOfBirth' => DateTime.new(1987, 1, 1),
              'Email' => 'bob.smith@smith.com',
              'FirstName' => 'J Robert Jr.',
              'LastName' => 'Love',
              'Phone' => '770-551-0007',
              'State' => 'MN',
              'Street1' => '444 Cedar Street',
              'Zip1' => 55101,
            }
          }
        },
        'Tags' => nil
      }
    })
  end
end

Then(/^I should receive compliance overview$/) do
  pending
end
