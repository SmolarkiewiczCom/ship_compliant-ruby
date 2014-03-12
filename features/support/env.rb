require 'bundler/setup'
Bundler.setup

require 'ship_compliant'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock

  c.filter_sensitive_data('<PARTNER_KEY>') { ENV.fetch('SHIP_COMPLIANT_KEY') }
  c.filter_sensitive_data('<USERNAME>') { ENV.fetch('SHIP_COMPLIANT_USER') }
  c.filter_sensitive_data('<PASSWORD>') { ENV.fetch('SHIP_COMPLIANT_PASS') }
end
