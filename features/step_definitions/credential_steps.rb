Given(/^I've added my credentials$/) do
  ShipCompliant.configure do |c|
    c.partner_key = ENV.fetch('SHIP_COMPLIANT_KEY')
    c.username = ENV.fetch('SHIP_COMPLIANT_USER')
    c.password = ENV.fetch('SHIP_COMPLIANT_PASS')
    c.log = false
  end
end
