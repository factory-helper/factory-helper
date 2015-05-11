require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

LoadedEsYaml = ['en', 'es'].inject({}) do |h, locale|
  h[locale] = YAML.load_file(File.expand_path(File.dirname(__FILE__) + "/../../lib/locales/#{locale}.yml"))[locale]['factory_helper']
  h
end

class TestEsLocale < Test::Unit::TestCase
  def teardown
    FactoryHelper::Config.locale = nil
  end

  def test_locale_separate_from_i18n
    I18n.locale = :en
    FactoryHelper::Config.locale = :es
    assert FactoryHelper::Address.street_name.match(//)
  end

  def test_configured_locale_translation
    FactoryHelper::Config.locale = 'es'
    assert_equal FactoryHelper::Base.translate('factory_helper.address.city_prefix').first, LoadedEsYaml['es']['address']['city_prefix'].first
  end

  def test_locale_override_when_calling_translate
    FactoryHelper::Config.locale = 'es'
    assert_equal FactoryHelper::Base.translate('factory_helper.lorem.words', :locale => :en).first, LoadedEsYaml['en']['lorem']['words'].first
  end

  def test_translation_fallback
    FactoryHelper::Config.locale = 'es'
    assert_nil LoadedEsYaml['es']['company']['bs']
    assert_equal FactoryHelper::Base.translate('factory_helper.company.bs'), LoadedEsYaml['en']['company']['bs']
  end
end
