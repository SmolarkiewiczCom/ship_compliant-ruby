---
layout: default
title: ShipCompliant - Ruby API Client
---

# Configuration Settings

Here's a list of available configuration options you can set.

- `partner_key` _ShipCompliant Partner Key_.
- `username` _ShipCompliant Username_.
- `password` _ShipCompliant Password_.
- `log` _Whether or not Savon should write to stdout_.

<h4 class="definition-title">Example Configuration</h4>

```ruby
ShipCompliant.configure do |c|
  c.partner_key = ENV.fetch('SHIP_COMPLIANT_KEY')
  c.username = ENV.fetch('SHIP_COMPLIANT_USER')
  c.password = ENV.fetch('SHIP_COMPLIANT_PASS')

  # SAVON OPTIONS
  c.log = false # defaults to true
end
```

---

Next step. View the [Getting Started Guide]({{ site.github.url }}/documentation/getting-started.html).
