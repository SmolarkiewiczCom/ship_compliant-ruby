---
layout: default
title: ShipCompliant - Ruby API Client
---

# Get Inventory Details

This method provides inventory details for each Product on a Fulfillment
Location, Fulfillment Account basis.

The method may be called with empty criteria to return all products with
Available inventory.

- [Official Documentation][official_docs]
- [GetInventoryDetails][get_inventory_details_class]
- [GetInventoryDetailsResult][get_inventory_details_result_class]
- [InventoryProduct][inventory_product_class]

<h4 class="definition-title">Definition</h4>

```ruby
ShipCompliant::GetInventoryDetails.call
```

<h4 class="definition-title">Example Request</h4>

```ruby
inventory = ShipCompliant::GetInventoryDetails.call({
  brand_key: 'DEN',
  fulfillment_location: 'WineShipping'
})
```

<h4 class="definition-title">Example Response</h4>

```ruby
products = inventory.products_for_location('WineShipping')

products.each do |product|
  puts "[%s] %s" % [product.product_key, product.description]

  product.inventory_levels.each do |type, quantity|
    puts "#{type.to_s.upcase}: #{quantity}"
  end
end
```

[official_docs]: https://shipcompliant.desk.com/customer/portal/articles/1455805-api-getinventorydetails-?b_id=2759
[get_inventory_details_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/GetInventoryDetails.html
[get_inventory_details_result_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/GetInventoryDetailsResult.html
[inventory_product_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/InventoryProduct.html
