# ShipCompliant - Ruby API Client

The ShipCompliant gem is an API Client for the [SOAP][soap_wiki] API provided by
ShipCompliant. This gem has been created for fast implementation and supports
the 9 main API calls.

[Documentation][documentation_path] | [RDoc][rdoc_path] | [CoreService V1.2][core_service_path]

[![Coverage Status]][coveralls_status] [![Build Status]][travis_status] [![Code Climate]][code_gpa]

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ship_compliant'
```

And then execute:

```bash
$ bundle install
```

Add this to `config/initializers/ship_compliant.rb`

```ruby
ShipCompliant.configure do |c|
  c.partner_key = ENV.fetch('SHIP_COMPLIANT_KEY')
  c.username = ENV.fetch('SHIP_COMPLIANT_USER')
  c.password = ENV.fetch('SHIP_COMPLIANT_PASS')
end
```

## Usage

TODO: Coming soon...

## Contributing

1. Fork it ( http://github.com/ShipCompliant/ship_compliant-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[soap_wiki]: http://en.wikipedia.org/wiki/SOAP

<!-- Documenation Links -->
[documentation_path]: http://shipcompliant.github.io/ship_compliant-ruby/documentation/
[rdoc_path]: http://shipcompliant.github.io/ship_compliant-ruby/rdoc/
[core_service_path]: https://shipcompliant.desk.com/customer/portal/articles/1451976-api-coreservice-v1-2?b_id=2759

<!-- Status Badges -->
[Coverage Status]: https://coveralls.io/repos/ShipCompliant/ship_compliant-ruby/badge.svg?branch=master
[coveralls_status]: https://coveralls.io/r/ShipCompliant/ship_compliant-ruby?branch=master

[Build Status]: https://travis-ci.org/ShipCompliant/ship_compliant-ruby.svg?branch=master
[travis_status]: https://travis-ci.org/ShipCompliant/ship_compliant-ruby

[Code Climate]: https://codeclimate.com/github/ShipCompliant/ship_compliant-ruby.svg
[code_gpa]: https://codeclimate.com/github/ShipCompliant/ship_compliant-ruby
