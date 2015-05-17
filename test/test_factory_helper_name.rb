require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFactoryHelperName < Test::Unit::TestCase

  def setup
    FactoryHelper::Config.locale= nil
    @genderized_test_locales= [:en, 'en-AU'.to_sym, 'en-au-ocker'.to_sym, 'en-BORK'.to_sym, 'en-CA'.to_sym, 'en-GB'.to_sym, 'en-IND'.to_sym, 'en-NEP'.to_sym, 'en-US'.to_sym]
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
    @genderized_test_locales.each do |locale|
      FactoryHelper::Config.locale= locale
      test_female_name
      test_male_name
    end
  end

  def test_genderized_name_missing
    FactoryHelper::Config.locale= :de
    assert_raise(I18n::MissingTranslationData) { @tester.female_name.match(/\A[A-Z][\w']+/) }
    assert_raise(I18n::MissingTranslationData) { @tester.male_name.match(/\A[A-Z][\w']+/) }
  end

private

  def test_female_name
    96.times do
      assert @tester.female_name.match(/\A[A-Z][\w']+/)
    end
  end

  def test_male_name
    24.times do
      assert @tester.male_name.match(/\A[A-Z][\w']+/)
    end
  end

end
