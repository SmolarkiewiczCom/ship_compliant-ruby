---
layout: default
title: ShipCompliant - Ruby API Client
---

# Get Inventory Details

This method provides inventory details for each Product on a Fulfillment
Location, Fulfillment Account basis.

The method may be called with empty criteria to return all products with
Available inventory.

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
