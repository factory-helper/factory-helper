require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFactoryHelperName < Test::Unit::TestCase

  def setup
    FactoryHelper::Config.locale = nil
    @tester = FactoryHelper::Name
    @first_name_matcher= /\A[A-Z][\w']+/
  end

  def teardown
    FactoryHelper::Config.locale = nil
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

  def test_girls_name_en
    FactoryHelper::Config.locale= 'en'
    test_female_name
  end

  def test_male_name_en
    FactoryHelper::Config.locale= 'en'
    test_male_name
  end

  def test_female_name_en_US
    FactoryHelper::Config.locale= 'en-US'
    test_female_name
  end

  def test_male_name_en_US
    FactoryHelper::Config.locale= 'en-US'
    test_male_name
  end

private

  def test_female_name
    600.times do
      assert @tester.female_name.match(@first_name_matcher)
    end
  end

  def test_male_name
    150.times do
      assert @tester.male_name.match(@first_name_matcher)
    end
  end

end
