When(/^I check compliance with a non\-compliant product$/) do
  VCR.use_cassette('compliance_noncompliant_product') do
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

Then(/^I should recive error messages$/) do
  pending
end
