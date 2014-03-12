---
layout: default-documentation
title: ShipCompliant - Ruby API Client
---

# Custom Requests

Currently we only support the 9 API calls from the
[CoreService][call_service_api]. But, you can always make a direct call to the
server through Savon SOAP client.

## Requesting Unsupported Methods

Here's a basic example of the [GetInventoryDetails][get_inventory_details] method.

```ruby
results = ShipCompliant.client.call(:get_inventory_details, {
  'BrandKey' => 'Estate',
  'FulfillmentLocation' => 'WineShipping',
  'InventoryType' => 'All',
  'ProductKey' => '03EstateZin'
})

puts results.inspect
```

## Change WSDL

If you need to use another Service, you can specify the WSDL you need
in the configure block or by `ShipCompliant.wsdl=`.

```ruby
# globally
ShipCompliant.configure do |c|
  c.wsdl = 'https://ws-dev.shipcompliant.com/Services/1.2/ProductService.asmx?WSDL'
end

# locally
ShipCompliant.wsdl = 'https://ws-dev.shipcompliant.com/Services/1.2/ProductService.asmx?WSDL'
```

[call_service_api]: https://shipcompliant.desk.com/customer/portal/articles/1451976-api-coreservice-v1-2?b_id=2759
[get_inventory_details]: https://shipcompliant.desk.com/customer/portal/articles/1455805-api-getinventorydetails-?b_id=2759
