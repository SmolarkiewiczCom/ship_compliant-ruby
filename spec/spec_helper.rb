require 'bundler/setup'
Bundler.setup

require 'ship_compliant'

RSpec.configure do |config|
  config.before(:each) do
    dummy_configuration unless example.metadata[:skip_config]
  end

  def dummy_configuration
    ShipCompliant.configure do |c|
      c.partner_key = 'abc-123'
      c.username = 'bob@example.com'
      c.password = 'secret'
      c.log = false
    end
  end

end
