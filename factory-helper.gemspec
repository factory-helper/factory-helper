# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'factory-helper/version'

Gem::Specification.new do |spec|
  spec.name          = "factory-helper"
  spec.version       = FactoryHelper::VERSION
  spec.authors       = ["theB264"]
  spec.email         = ["public88878878887@hotmail.com"]
  spec.summary       = %q{Easily generate fake data}
  spec.description   = %q{Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
