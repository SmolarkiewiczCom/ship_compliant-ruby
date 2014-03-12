---
layout: default-documentation
title: ShipCompliant - Ruby API Client
---

# Getting Started

The ShipCompliant Ruby API client tries to mirror the offical SOAP methods while
retaining Ruby style.

When looking through the [CoreService Documentation][core_service], you'll see
API requests like so.

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

[core_service]: https://shipcompliant.desk.com/customer/portal/articles/1451976-api-coreservice-v1-2?b_id=2759
