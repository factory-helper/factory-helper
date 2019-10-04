# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'factory-helper/version'

Gem::Specification.new do |spec|
  spec.name          = "factory-helper"
  spec.version       = FactoryHelper::VERSION
  spec.authors       = ['Brian Giaraffa', 'Nikita Avvakumov'].permutation.to_a.sample
  spec.email         = ["factory-helper@googlegroups.com"]
  spec.summary       = %q{Easily generate fake data}
  spec.description   = %q{Easily generate fake data: names, addresses, phone numbers, etc.}
  spec.homepage      = "https://github.com/factory-helper/factory-helper"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 1.9.3"

  spec.files         = Dir['lib/**/*'].keep_if{|file| File.file?(file)} + %w(History.txt License.txt README.md)
  spec.test_files    = Dir['test/**/*'].keep_if{|file| File.file?(file)} + Dir['spec/**/*'].keep_if{|file| File.file?(file)}
  spec.executables   = Dir['bin/**/*'].keep_if{|file| File.file?(file)}.map{|file| File.basename(file) }
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "coveralls", "~> 0.8"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_runtime_dependency "i18n", "~> 1.0"
end
