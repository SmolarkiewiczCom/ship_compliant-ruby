---
layout: default
title: ShipCompliant - Ruby API Client
---

# Search More Orders

This method is used in conjunction with SearchSalesOrders to get more results
from the search that was performed using SearchSalesOrders. This method will
return 100 results each time.

> The response is identical to `SearchSalesOrders`

- [Official Documentation][official_docs]
- [SearchMoreSalesOrders][search_more_sales_orders_class]
- [SearchSalesOrdersResult][search_sales_orders_result_class]
- [SearchSalesOrderSummary][search_sales_order_summary_class]

<h4 class="definition-title">Definition</h4>

```ruby
ShipCompliant::SearchMoreSalesOrders.paging_cookie
```

<h4 class="definition-title">Example Request</h4>

```ruby
orders = ShipCompliant::SearchMoreSalesOrders.paging_cookie('paging-cookie')
```

<h4 class="definition-title">Example Response</h4>

```ruby
if orders.failure?
  puts "ERROR: #{orders.error_message}"
  exit(1)
end

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

[official_docs]: https://shipcompliant.desk.com/customer/portal/articles/1456028-api-searchmoresalesorders-?b_id=2759
[search_more_sales_orders_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/SearchMoreSalesOrders.html
[search_sales_orders_result_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/SearchSalesOrdersResult.html
[search_sales_order_summary_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/SearchSalesOrderSummary.html
