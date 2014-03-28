require 'bundler/setup'
Bundler.setup

require 'coveralls'
Coveralls.wear!

require "rspec"
require "set"
require 'ship_compliant'
require "savon/mock/spec_helper"

RSpec.configure do |config|
  config.include Savon::SpecHelper

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.before(:each) do
    ShipCompliant.configuration = nil
    ShipCompliant.ship_compliant_client = nil
    ShipCompliant.configure do |c|
      c.partner_key = 'abc-123'
      c.username = 'bob@example.com'
      c.password = 'secret'
      c.log = false
      c.wsdl = 'spec/fixtures/coreservice.wsdl'
    end
  end

end

shared_examples_for "BaseResult" do
  context "success?" do
    it "returns true when the response was successful" do
      result = described_class.new({ response_status: 'Success' })
      result.success?.should be_true
    end
  end

  context "failure?" do
    it "returns the opposite of success?" do
      result = described_class.new({})
      result.stub(:success?) { false }
      result.failure?.should be_true
    end
  end
end
