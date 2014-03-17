---
layout: default-documentation
title: ShipCompliant - Ruby API Client
---

# SalesOrder Compliance Check

The CheckComplianceOfSalesOrderWithAddressValidation API method is used for real
time compliance checks from the order point of entry (eCommerce, POS).  

The method can do three things in one call:

- Calculate Sales Tax Due for order and return product level tax rates
(IncludeSalesTaxRates = true)
- Validate the ShipTo address and get normalized address result
- Check compliance of the order

This method takes requires specific order information from the order point of
entry for ShipCompliant to check the order for compliance. The sales order will
not be committed via this method. This API call is usually paired with
CommitSalesOrder() to save the sales order to ShipCompliant.

- [Official Documentation][official_docs]
- [CheckCompliance][check_compliance_class]
- [CheckComplianceResult][check_compliance_result_class]
- [ShipmentSalesTaxRate][shipment_sales_tax_rate_class]
- [ShipmentCompliance][shipment_compliance_class]
- [ComplianceRule][compliance_rule_class]
- [SuggestedAddress][suggested_address_class]

<h4 class="definition-title">Definition</h4>

```ruby
ShipCompliant::CheckCompliance.of_sales_order
```

<h4 class="definition-title">Example Request</h4>

```ruby
compliance_status = ShipCompliant::CheckCompliance.of_sales_order({
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
```

<h2 class="definition-title">Missing Product Response</h2>

```ruby
if compliance_status.failure?
  puts "There were #{compliance_status.error_count} errors."

  compliance_status.errors.each_with_index do |error, i|
    puts "#{i + 1}. #{error.message}"
    puts "\t CODE: #{error.code}; KEY: #{error.key}; TARGET: #{error.target}; TYPE: #{error.type}"
  end
end
```

<h2 class="definition-title">Non-Compliant Product Response</h2>

```ruby
unless compliance_status.compliant?
  shipment = compliance_status.compliance_rules_for_shipment('1')
  errors = shipment.rules.reject { |r| r.compliant? }

  errors.each do |error|
    puts error.rule_description
  end
end
```

<h2 class="definition-title">Example Suggested Address</h2>

```ruby
address = compliance_status.suggested_address

puts "Suggested Address\n"

puts "\t#{address.street1}"
puts "\t#{address.street2}" unless address.street2.blank?
puts "\t#{address.city}, #{address.state} (#{address.zip1}-#{address.zip2}"
```

---

For more examples, have a look at the [Cucumber specs][cucumber_specs]. You'll be able to see both
a request made and how handle the response.

[official_docs]: https://shipcompliant.desk.com/customer/portal/articles/1451915-api-checkcomplianceofsalesorderwithaddressvalidation-?b_id=2759
[check_compliance_class]: ../rdoc/classes/ShipCompliant/CheckCompliance.html
[check_compliance_result_class]: ../rdoc/classes/ShipCompliant/CheckComplianceResult.html
[shipment_sales_tax_rate_class]: ../rdoc/classes/ShipCompliant/ShipmentSalesTaxRate.html
[shipment_compliance_class]: ../rdoc/classes/ShipCompliant/ShipmentCompliance.html
[compliance_rule_class]: ../rdoc/classes/ShipCompliant/ComplianceRule.html
[suggested_address_class]: ../rdoc/classes/ShipCompliant/SuggestedAddress.html
[cucumber_specs]: https://github.com/BaylorRae/ship_compliant-ruby/tree/master/features/step_definitions/compliance_check
