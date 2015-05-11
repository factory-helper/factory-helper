require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFactoryHelperTeam < Test::Unit::TestCase

  def setup
    @tester = FactoryHelper::Team
  end

  def test_name
    assert @tester.name.match(/(\w+\.? ?){2}/)
  end

end
