require 'coveralls'
Coveralls.wear_merged!

require 'minitest/autorun'
require 'rubygems'
require File.expand_path(File.dirname(__FILE__) + '/../lib/factory-helper')

# configure I18n
locales_path = File.expand_path(File.dirname(__FILE__) + '../lib/locales')
I18n.available_locales = Dir[locales_path + '/*'].map do |file|
  file.split('.').first
end
I18n.enforce_available_locales = true

# configure Faker
FactoryHelper::Config.locale = nil
