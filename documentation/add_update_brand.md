---
layout: default
title: ShipCompliant - Ruby API Client
---

# Managing Brands

Brands and Products must be syncronized between the OMS system and ShipCompliant
for seamless order flow.  Each product is associated to an overall brand & the
brand must exist before adding a product with the brand.  Below is how to add or
update a new brand to ShipCompliant through the API.

This method checks to see if a brand with the same key already exists. If one
does not exist, it will add the brand with the specified name. If a brand exists
with the same brand key then the brand name will be updated.

Use this method to add a new brand or update an existing brand in the system. A
brand must be defined before adding products.

- [Official Documentation][official_docs]
- [AddUpdateBrand][add_update_brand_class]
- [AddUpdateBrandResult][add_update_brand_result_class]

<h4 class="definition-title">Definition</h4>

```ruby
ShipCompliant::AddUpdateBrand.brand
```

<h4 class="definition-title">Example Request</h4>

```ruby
brand_result = ShipCompliant::AddUpdateBrand.brand({
  key: 'DENSNW',
  name: 'Denver Snow',

  this_brand_is_bottled_by_a_third_party: false,
  this_brand_is_produced_by_a_third_party: false,
  this_brand_operates_under_a_trade_name: false,
  this_brand_was_acquired_from_a_third_party: false
}, update_mode: 'IgnoreExisting')
```

<h4 class="definition-title">Example Response</h4>

```ruby
if brand_result.success?
  puts "Brand created successfully."
end
```

[official_docs]: https://shipcompliant.desk.com/customer/portal/articles/1451978-api-addupdatebrand-?b_id=2759
[add_update_brand_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/AddUpdateBrand.html
[add_update_brand_result_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/AddUpdateBrandResult.html
