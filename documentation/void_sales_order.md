---
layout: default
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

<h4 class="definition-title">Definition</h4>

```ruby
ShipCompliant::VoidSalesOrder.by_order_key
```

<h4 class="definition-title">Example Request</h4>

```ruby
result = ShipCompliant::VoidSalesOrder.by_order_key('OrderKey')
```

<h4 class="definition-title">Example Response</h4>

```ruby
if result.success?
  puts "Order Voided"
else
  puts "Failed to void order"

  result.errors.each do |error|
    puts "\t[%d] %s" % [error.code, error.message]
  end
end
```

[official_docs]: https://shipcompliant.desk.com/customer/portal/articles/1462186-api-voidsalesorder-?b_id=2759
[void_sales_order_class]: ../rdoc/classes/ShipCompliant/VoidSalesOrder.html
[void_sales_order_result_class]: ../rdoc/classes/ShipCompliant/VoidSalesOrderResult.html
