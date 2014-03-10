# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ship_compliant/version'

Gem::Specification.new do |s|
  s.name          = "ship_compliant"
  s.version       = ShipCompliant::VERSION
  s.authors       = ["Baylor Rae'"]
  s.email         = ["baylorrae@gmail.com"]
  s.summary       = %q{SOAP Api Client for ShipCompliant}
  s.description   = %q{SOAP Api Client for ShipCompliant}
  s.homepage      = ""
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "savon", "~> 2.3.0"

  s.add_development_dependency "bundler", "~> 1.5"
  s.add_development_dependency "rake"

  # TESTING
  s.add_development_dependency "rspec", "~> 2.14.1"
end
