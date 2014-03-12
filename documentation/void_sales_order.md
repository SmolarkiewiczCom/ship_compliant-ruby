---
layout: default-documentation
title: ShipCompliant - Ruby API Client
---

# Voiding Orders
This method takes in a sales order key and
voids all shipments in an existing sales order.
Voided shipments do not count towards volume limits or reporting.

Use this method if an order has been voided. You can also use this method to
void an order with committed shipments before entering a new order with the same order key.

- [Official Documentation][official_docs]
- [VoidSalesOrder][void_sales_order_class]
- [VoidSalesOrderResult][void_sales_order_result_class]

# Examples

## 1. Void an Order by SalesOrderKey

```ruby
result = ShipCompliant::VoidSalesOrder.by_order_key('OrderKey')

if result.success?
  puts "Order Voided"
else
  puts "Failed to void order"
  puts "[%d] %s" % [result.error_code, result.error_message]
end
```

## 2. Voiding Non-Compliant Orders

This example finds all non-compliate sales orders older than a week and voids
them. You might use something like this in a CRON job to reset the volume limits
and reporting on a daily basis.

```ruby
orders = ShipCompliant::SearchSalesOrders.find_by({
  compliance_status: 'NotCompliant',
  purchase_date_max: 1.week.ago.to_date,
  purchase_date_min: DateTime.new(1900, 1, 1) # required field
})

puts "#{orders.length} non-compliant orders found"

orders.each do |order|
  result = ShipCompliant::VoidSalesOrder.by_order_key(order.order_key)

  if result.success?
    puts "Order #{order.order_key} voided successfully."
  else
    puts "FAILED: Order #{order.order_key} could not be voided. Message:
    #{result.error_message}"
  end
end
```

[official_docs]: https://shipcompliant.desk.com/customer/portal/articles/1462186-api-voidsalesorder-?b_id=2759
[void_sales_order_class]: ../rdoc/classes/ShipCompliant/VoidSalesOrder.html
[void_sales_order_result_class]: ../rdoc/classes/ShipCompliant/VoidSalesOrderResult.html
