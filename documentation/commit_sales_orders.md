---
layout: default-documentation
title: ShipCompliant - Ruby API Client
---

# Committing Orders

This method takes in a Sales Order Key in the request and saves the order if it
has previously been checked for compliance.

- If the CommitOption is set to “AllShipments”, all the shipments in the sales
  order will be committed.

- If it is set to “CompliantShipments”, just the non-committed compliant sales
  orders will be committed.

Please keep in mind that if “CompliantShipments” is selected, it will be of
great value to the customer if the non-compliant, non-committed orders were
flagged as such for further review.

If the CommitOption is not specified, zero shipments will be committed. This
allows the integrator to get the commit status of the shipments in a sales order
without committing any of them.

- [Official Documentation][official_docs]
- [CommitSalesOrder][commit_sales_order_class]
- [CommitSalesOrderResult][commit_sales_order_result_class]

# Examples

## 1. Commit All Shipments

```ruby
result = ShipCompliant::CommitSalesOrder.call({
  commit_options: 'AllShipments',
  payments: nil,
  sales_tax_collected: 0,
  sales_order_key: 'ORDER-KEY'
})

puts result.success? #=> true
puts "The following shipments were committed."

puts result.committed_shipments #=> ['1', '2', ...]
```

[official_docs]: https://shipcompliant.desk.com/customer/portal/articles/1452750-api-commitsalesorder-?b_id=2759
[commit_sales_order_class]: ../rdoc/classes/ShipCompliant/CommitSalesOrder.html
[commit_sales_order_result_class]: ../rdoc/classes/ShipCompliant/CommitSalesOrderResult.html
