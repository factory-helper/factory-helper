require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFactoryHelperName < Test::Unit::TestCase

  def setup
    FactoryHelper::Config.locale = nil
    @tester = FactoryHelper::Name
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

  def test_girls_first_name_en_US
    FactoryHelper::Config.locale= 'en-US'.to_sym
    1200.times do
      assert @tester.girls_first_name.match(/^([A-Z])(\w)*$/)
    end
  end

  def test_boys_first_name_en_US
    FactoryHelper::Config.locale= 'en-US'.to_sym
    300.times do
      assert @tester.boys_first_name.match(/^([A-Z])(\w)*$/)
    end
  end

end
