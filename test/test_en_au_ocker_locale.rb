require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestEnUsLocale < Test::Unit::TestCase
  def setup
    FactoryHelper::Config.locale = nil
  end

  def teardown
    FactoryHelper::Config.locale = nil
  end

  def test_au_ocker_methods_with_en_au_ocker_locale
    FactoryHelper::Config.locale = 'en-au-ocker'

    assert FactoryHelper::Name.first_name.is_a? String
    assert FactoryHelper::Name.last_name.is_a? String
    assert FactoryHelper::Name.ocker_first_name.is_a? String
    assert FactoryHelper::Address.street_name.is_a? String
    assert FactoryHelper::Address.city.is_a? String
    assert FactoryHelper::Address.region.is_a? String
  end

end
