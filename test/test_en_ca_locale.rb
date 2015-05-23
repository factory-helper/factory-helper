require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestEnCaLocale < Minitest::Test
  def setup
    @previous_locale = FactoryHelper::Config.locale
    FactoryHelper::Config.locale = 'en-CA'
  end

  def teardown
    FactoryHelper::Config.locale = @previous_locale
  end

  def test_ca_postcode
    expected = /[A-VX-Y][0-9][A-CEJ-NPR-TV-Z] ?[0-9][A-CEJ-NPR-TV-Z][0-9]/
    assert_match(expected, FactoryHelper::Address.postcode)
  end

end
