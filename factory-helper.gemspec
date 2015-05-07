# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'factory-helper/version'

Gem::Specification.new do |spec|
  spec.name          = "factory-helper"
  spec.version       = FactoryHelper::VERSION
  spec.authors       = ["Brian Giaraffa", "Nikita Avvakumov"]
  spec.email         = ["factory-helper@googlegroups.com"]
  spec.summary       = %q{Easily generate fake data}
  spec.description   = %q{Easily generate fake data: names, addresses, phone numbers, etc.}
  spec.homepage      = "https://github.com/factory-helper/factory-helper"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 1.9.2"

  spec.add_dependency('i18n', '0.6.9')

  spec.files         = `git ls-files -- lib/*`.split("\n") + %w(History.txt License.txt README.md)
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "coveralls"
end
