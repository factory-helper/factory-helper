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

  def test_girls_name_en_US
    FactoryHelper::Config.locale= 'en-US'
    1200.times do
      assert @tester.girls_name.match(/^([A-Z])(\w)*$/)
    end
  end

  def test_boys_name_en_US
    FactoryHelper::Config.locale= 'en-US'
    300.times do
      assert @tester.boys_name.match(/^([A-Z])(\w)*$/)
    end
  end

end
