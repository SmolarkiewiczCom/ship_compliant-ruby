---
layout: default
title: ShipCompliant - Ruby API Client
---

# Get Updates for Committed Orders

This method takes in a Sales Order Key and returns detailed data about the sales
order, including compliance status.

Use this method to query the full details of a sales order and the shipments in
the sales order.

- [Official Documentation][official_docs]
- [GetSalesOrderExtended][get_sales_order_extended_class]
- [GetSalesOrderExtendedResult][get_sales_order_extended_result_class]
- [Address][address_class]
- [ChannelDetails][channel_details_class]
- [Package][package_class]
- [Shipment][shipment_class]
- [ShipmentCompliance][shipment_compliance_class]

<h4 class="definition-title">Definition</h4>

```ruby
ShipCompliant::GetSalesOrderExtended.by_order_key
```

<h4 class="definition-title">Example Request</h4>

```ruby
order_result = ShipCompliant::GetSalesOrderExtended.by_order_key('1006890')
```

<h4 class="definition-title">Getting Compliance Descriptions</h4>

```ruby
shipment_compliance = order_result.compliance_rules_for_shipment('1')

if shipment_compliance.compliant?
  puts "Shipment is compliant"
else
  puts "There are compliance exceptions"

  shipment_compliance.rules.each do |rule|
    puts rule.compliance_description
  end
end
```

<h4 class="definition-title">Receiving Billing Information</h4>

```ruby
billing = order_result.bill_to

puts "Customer: #{billing.first_name} #{billing.last_name}"
puts "DOB: #{billing.date_of_birth.strftime('%B %d, %Y')}"
puts "Location: #{billing.city}, #{billing.state}"
```

<h4 class="definition-title">Shipment Information</h4>

```ruby
shipment = order_result.find_shipment('1')

puts "Shipping Charges: $#{shipment.shipping}"
puts "Insured For: $#{shipment.insured_amount}"

puts "Tracking Numbers:"

shipment.packages.each do |package|
  puts "- #{package.tracking_number} (#{package.tracking_status})"
end
```

[official_docs]: https://shipcompliant.desk.com/customer/portal/articles/1456002-api-getsalesorderextended-?b_id=2759
[get_sales_order_extended_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/GetSalesOrderExtended.html
[get_sales_order_extended_result_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/GetSalesOrderExtendedResult.html
[address_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/Address.html
[channel_details_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/ChannelDetails.html
[package_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/Package.html
[shipment_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/Shipment.html
[shipment_compliance_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/ShipmentCompliance.html
