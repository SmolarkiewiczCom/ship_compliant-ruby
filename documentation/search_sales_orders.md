---
layout: default-documentation
title: ShipCompliant - Ruby API Client
---

# Search for Orders

Search orders in the ShipCompliant database on a number of different
criteria such as date ranges, order number range, order list, status, etc...

Results are paged, and only the first 100 results are returned with this method.
Use the `remaining_orders_length` method in conjunction with this method to
page through the result set.

- [Official Documentation][official_docs]
- [SearchSalesOrders][search_sales_orders_class]
- [SearchSalesOrdersResult][search_sales_orders_result_class]
- [SearchSalesOrderSummary][search_sales_order_summary_class]


# Examples

## 1. Orders with date range
```ruby
orders = ShipCompliant::SearchSalesOrders.find_by({
  purchase_date_min: DateTime.new(2014, 3, 10),
  purchase_date_max: DateTime.new(2014, 3, 12)
})

puts "#{orders.length} orders found"

orders.each do |order|
  puts "ORDER #{order.order_key}"
  puts "---\n"

  puts "- Purchased On: #{order.purchase_date.strftime('%B %d, %Y')}"
  puts "- Requested Ship Date:
  #{order.shipment_summary[:requested_ship_date].strftime('%B %d, %Y')}"
  puts "- Shipped On: #{order.shipment_summary[:ship_date].strftime('%B %d,
  %Y')}"
end
```

## 2. Find Non-Compliant Orders

```ruby
# possible statuses are "Compliant", "NotCompliant", or "Any". Any is default.
orders = ShipCompliant::SearchSalesOrders.find_by({
  compliance_status: 'NotCompliant'
})

puts "#{orders.length} orders found"

orders.each do |order|
  puts "ORDER #{order.order_key} is not compliant"
  puts "---"
end
```

[official_docs]: https://shipcompliant.desk.com/customer/portal/articles/1456007-api-searchsalesorders-?b_id=2759
[search_sales_orders_class]: ../rdoc/classes/ShipCompliant/SearchSalesOrders.html
[search_sales_orders_result_class]: ../rdoc/classes/ShipCompliant/SearchSalesOrdersResult.html
[search_sales_order_summary_class]: ../rdoc/classes/ShipCompliant/SearchSalesOrderSummary.html
