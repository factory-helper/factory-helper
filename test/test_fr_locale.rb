# frozen_string_literal: true
require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

LoadedFrYaml = ['en', 'fr'].inject({}) do |h, locale|
  h[locale] = YAML.load_file(File.expand_path(File.dirname(__FILE__) + "/../lib/locales/#{locale}.yml"))[locale]['factory_helper']
  h
end

class TestFrLocale < Test::Unit::TestCase
  def teardown
    FactoryHelper::Config.locale = nil
  end

  def test_locale_separate_from_i18n
    I18n.locale = :en
    Faker::Config.locale = :fr
    assert FactoryHelper::Address.street_name.match(//)
  end

  def test_configured_locale_translation
    Faker::Config.locale = 'fr'
    assert_equal FactoryHelper::Base.translate('factory_helper.address.state').first, LoadedFrYaml['fr']['address']['state'].first
  end

  def test_locale_override_when_calling_translate
    Faker::Config.locale = 'fr'
    assert_equal FactoryHelper::Base.translate('factory_helper.lorem.words', :locale => :en).first, LoadedFrYaml['en']['lorem']['words'].first
  end

  def test_translation_fallback
    Faker::Config.locale = 'fr'
    assert_nil LoadedFrYaml['fr']['address']['time_zone']
    assert_equal FactoryHelper::Base.translate('factory_helper.address.time_zone'), LoadedFrYaml['en']['address']['time_zone']
  end
end
