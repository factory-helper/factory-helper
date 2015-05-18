require 'coveralls'
Coveralls.wear_merged!

require 'test/unit'
require 'rubygems'
require 'yaml'
YAML::ENGINE.yamler = 'psych' if defined? YAML::ENGINE
require File.expand_path(File.dirname(__FILE__) + '/../lib/factory-helper')

# configure I18n
locales_path = File.expand_path(File.dirname(__FILE__) + '../lib/locales')
I18n.available_locales = Dir[locales_path + '/*'].map do |file|
  file.split('.').first
end
I18n.enforce_available_locales = true
