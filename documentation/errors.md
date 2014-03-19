---
layout: default
title: ShipCompliant - Ruby API Client
---

# Response Errors

Whenever an error occurs from a request you can get the messages and error codes
from `BaseResult#errors`.

> `BaseResult#errors` returns an array of [ErrorResult][error_result_class] instances.

#### [ErrorResult Methods][error_result_class]

- `code`
- `key`
- `message`
- `target`
- `type`

<h4 class="definition-title">Example Request</h4>

```ruby
search_result = ShipCompliant::SearchSalesOrders.find_by({
  purchase_date_max: Date.new(2014, 2, 21),
  # purchase_date_min: Date.new(2014, 2, 19) (required field)
})
```

<h4 class="definition-title">Example Response</h4>

```ruby
if search_result.failure?
  puts "FAILED!"

  search_result.errors.each do |error|
    puts error.message #=> 'SalesOrder search must include...'
  end

  exit(1)
end
```

---

Next Step. Learn how to make [Custom Requests][custom_requests].

[custom_requests]: {{ site.github.url }}/documentation/custom-requests.html
[error_result_class]: {{ site.github.url }}/rdoc/classes/ShipCompliant/ErrorResult.html
