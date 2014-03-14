When(/^I check compliance with an available product$/) do
  VCR.use_cassette('compliance_available_product') do
    @compliance_status = ShipCompliant::CheckCompliance.of_sales_order({
      address_option: {
        ignore_street_level_errors: true,
        reject_if_address_suggested: false
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
  pending
end

Then(/^I should receive the shipment compliance$/) do
  pending # express the regexp above with the code you wish you had
end
