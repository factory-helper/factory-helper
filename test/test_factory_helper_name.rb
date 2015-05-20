require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFactoryHelperName < Test::Unit::TestCase

  def setup
    FactoryHelper::Config.locale= nil
    @genderized_en_test_locales= [:en, :'en-AU', :'en-au-ocker', :'en-CA', :'en-GB', :'en-IND', :'en-NEP', :'en-US']
    @tester = FactoryHelper::Name
  end

  def teardown
    FactoryHelper::Config.locale= nil
  end

  def test_name
    assert @tester.name.match(/(\w+\.? ?){2,3}/)
  end

  def test_prefix
    assert @tester.prefix.match(/[A-Z][a-z]+\.?/)
  end

  def test_suffix
    assert @tester.suffix.match(/[A-Z][a-z]*\.?/)
  end

  def test_genderized_name_locales
    @genderized_en_test_locales.each do |locale|
      FactoryHelper::Config.locale= locale
      test_female_name
      test_male_name
    end
  end

  def test_genderized_name
    test_female_name
    test_male_name
  end

private

  def test_female_name
    384.times do
      assert @tester.female_name.match(/\A[A-Z][\w']+\z/)
    end
  end

  def test_male_name
    96.times do
      assert @tester.male_name.match(/\A[A-Z][\w']+\z/)
    end
  end

end
