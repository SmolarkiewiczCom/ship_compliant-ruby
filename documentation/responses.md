---
layout: default
title: ShipCompliant - Ruby API Client
---

# Working With Responses

Every request made returns an instance of [BaseResult class][base_result_class].

#### [BaseResult Methods][base_result_class]

- `success?` <small>(boolean) Response status succeeded.</small>
- `failure?` <small>(boolean) Response status failed.</small>
- `error_count` <small>(integer) The number of errors.</small>
- `errors` <small>(array) [ErrorResult][error_result_class].</small>

<h4 class="definition-title">Example Request</h4>

```ruby
search_result = ShipCompliant::SearchSalesOrders.find_by({
  purchase_date_max: Date.new(2014, 2, 21),
  purchase_date_min: Date.new(2014, 2, 19)
})
```

<h4 class="definition-title">Example Response</h4>

```ruby
if search_result.failure?
  puts "There were #{pluralize(search_result.error_count, 'error')}!"
  exit(1)
end

if search_result.success?
  puts "Orders Found"
end
```

---

Next Step. Learn how to work with [Response Errors][response_errors].

[rdocs]: {{ site.github.url }}/rdoc
[base_result_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/BaseResult.html
[error_result_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/ErrorResult.html
[response_errors]: {{ site.github.url }}/documentation/errors.html

