require File.expand_path(File.dirname(__FILE__) + '/../test_helper.rb')

LoadedFakerEsYaml = ['en', 'es'].inject({}) do |h, locale|
  h[locale] = YAML.load_file(File.expand_path(File.dirname(__FILE__) + "/../../lib/locales/#{locale}.yml"))[locale]['factory_helper']
  h
end

class TestFakerEsLocale < Test::Unit::TestCase
  def teardown
    Faker::Config.locale = nil
  end

  def test_locale_separate_from_i18n
    I18n.locale = :en
    Faker::Config.locale = :es
    assert Faker::Address.street_name.match(//)
  end

  def test_configured_locale_translation
    Faker::Config.locale = 'es'
    assert_equal Faker::Base.translate('factory_helper.address.city_prefix').first, LoadedFakerEsYaml['es']['address']['city_prefix'].first
  end

  def test_locale_override_when_calling_translate
    Faker::Config.locale = 'es'
    assert_equal Faker::Base.translate('factory_helper.lorem.words', :locale => :en).first, LoadedFakerEsYaml['en']['lorem']['words'].first
  end

  def test_translation_fallback
    Faker::Config.locale = 'es'
    assert_nil LoadedFakerEsYaml['es']['company']['bs']
    assert_equal Faker::Base.translate('factory_helper.company.bs'), LoadedFakerEsYaml['en']['company']['bs']
  end
end
