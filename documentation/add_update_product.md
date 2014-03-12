---
layout: default-documentation
title: ShipCompliant - Ruby API Client
---

# Managing Products

This method checks to see if a product with the same product key and brand key
already exists.

If one does not exist, it will add the product with the specified information.

If a product exists with the same product key and brand key, but is not
referenced by any shipments, the product will be updated with the specified
information.

If a product exists with the same product key and brand key, and is referenced
by one or more shipments, the product will not be updated.


- [Official Documentation][official_docs]
- [AddUpdateProduct][add_update_order_class]
- [AddUpdateProductResult][add_update_order_result_class]

# Examples

## 1. Update Existing Product

If you set the `update_mode` to `UpdateExisting` you can update part of a
product.

```ruby
result = ShipCompliant::AddUpdateProduct.product({

  # product to update
  brand_key: 'DENSNW',
  product_key: 'SNFL13',

  # information to update
  unit_price: 54.99

}, update_mode: 'UpdateExisting')

if result.success?
  puts "Product Updated Successfully"
else
  puts "FAILED: #{result.error_message}"
end
```

[official_docs]: https://shipcompliant.desk.com/customer/portal/articles/1451989-api-addupdateproduct-?b_id=2759
[add_update_order_class]: ../rdoc/classes/ShipCompliant/AddUpdateProduct.html
[add_update_order_result_class]: ../rdoc/classes/ShipCompliant/AddUpdateProductResult.html
