# ShipCompliant - Ruby API Client

The ShipCompliant gem is a API Client for the [SOAP][soap_wiki] API provided by
ShipCompliant. This gem has been created for fast implementation and supports
the 9 main API calls.

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

1. Fork it ( http://github.com/BaylorRae/ship\_compliant-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[soap_wiki]: http://en.wikipedia.org/wiki/SOAP
