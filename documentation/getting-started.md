---
layout: default-documentation
title: ShipCompliant - Ruby API Client
---

# Getting Started

The ShipCompliant Ruby API client tries to mirror the offical SOAP methods while
retaining Ruby style.

## Making Requests

When looking through the [CoreService Documentation][core_service], you'll see
API requests like so. In most cases, the name of the SOAP method is the name of
the API wrapper class. E.g. `SearchSalesOrders()` can be called with
[ShipCompliant::SearchSalesOrders][search_sales_orders_class].

```xml
<!-- API: SearchSalesOrders(). -->

<!-- Sample Request -->
<ws:SearchSalesOrders>
  <ws:Request>
    <ws:Security>
      <ws:PartnerKey>XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX</ws:PartnerKey>
      <ws:Password>XXXXXXXX</ws:Password>
      <ws:Username>testws@six88.com</ws:Username>
    </ws:Security>
    <ws:PurchaseDateMax>2014-02-21</ws:PurchaseDateMax>
    <ws:PurchaseDateMin>2012-02-19</ws:PurchaseDateMin>
    <ws:TrackingExistence>ZeroTrackingNumbers</ws:TrackingExistence>
  </ws:Request>
</ws:SearchSalesOrders>
```

The equivalent of this same request with the Ruby Client is as follows (_given
you've added your credentials_).

```ruby
ShipCompliant::SearchSalesOrders.find_by({
  purchase_date_max: Date.new(2014, 2, 21),
  purchase_date_min: Date.new(2014, 2, 19),
  tracking_existence: 'ZeroTrackingNumbers'
})
```

You can view the list of available API methods in the [RDoc
documentation][rdocs].

## The Response

The convention for each result class is to append `Result` to the class called.
E.g. For `SearchSalesOrder`, the result class would be
`SearchSalesOrdersResult`.

All requests made support the following methods from
[BaseResult][base_result_class].

- `error_count` <small>(integer) The number of errors.</small>
- `errors` <small>(array) [ErrorResult][error_result_class].</small>
- `failure?` <small>(boolean) Response status failed.</small>
- `success?` <small>(boolean) Response status succeeded.</small>

Next Step. Learn how to make [Custom Requests][custom_requests].

[core_service]: https://shipcompliant.desk.com/customer/portal/articles/1451976-api-coreservice-v1-2?b_id=2759
[search_sales_orders_class]: ../rdoc/classes/ShipCompliant/SearchSalesOrders.html
[rdocs]: ../rdoc
[base_result_class]: ../rdoc/classes/ShipCompliant/BaseResult.html
[error_result_class]: ../rdoc/classes/ShipCompliant/ErrorResult.html
[custom_requests]: custom-requests.html
