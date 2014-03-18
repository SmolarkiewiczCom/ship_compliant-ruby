---
layout: default
title: ShipCompliant - Ruby API Client
---

# Custom Requests

Currently we only support the 9 API calls from the
[CoreService][call_service_api]. But, you can always make a direct call to the
server through Savon SOAP client.

## Requesting Unsupported Methods

Here's a basic example of the [GetInventoryDetails][get_inventory_details] method.

<h4 class="definition-title">Definition</h4>

```ruby
ShipCompliant.client.call
```

<h4 class="definition-title">Example Request</h4>

```ruby
results = ShipCompliant.client.call(:get_inventory_details, {
  'BrandKey' => 'DEN',
  'FulfillmentLocation' => 'WineShipping',
  'InventoryType' => 'All'
})
```

<h4 class="definition-title">Example Response</h4>

```ruby
{
  inventory_locations: {
    inventory_location: {
      fulfillment_account: nil,
      fulfillment_location: "WineShipping",
      inventory_products: {
        inventory_product: {
          brand_key: "DEN",
          default_case: "12x750 mL",
          description: "Capital Hill Reserve Cabernet",
          fulfillment_sku: "04CHRCAB75",
          inventory_levels: {
            inventory_level: {
              effective_date: DateTime.new(2014, 3, 13, 18, 0, 6),
              inventory_type: "Available",
              quantity: "25",
              synchronization_date: DateTime.new(2014, 3, 13, 18, 0, 6)
            }
          },
          percent_alcohol: "13",
          product_key: "04CHRCAB75",
          product_type: "Wine",
          unit_price: "0",
          varietal: nil,
          vintage: "2011",
          volume_amount: "750",
          volume_ml: "750",
          volume_unit: "Milliliter"
        }
      },
      sub_inventory_code: nil,
      supplier: "ShipC Library Wines"
    }
  },
  response_status: "Success"
}
```

**Note:** Making a direct call returns a Hash from the elements within the
`METHOD_result` node.

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
[savon_response]: http://rubydoc.info/gems/savon/Savon/Response
