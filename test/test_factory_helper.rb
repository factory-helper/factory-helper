require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFactoryHelper < Test::Unit::TestCase

  def setup
  end

  def test_numerify
    100.times do
      assert FactoryHelper::Base.numerify('###').match(/[1-9]\d{2}/)
    end
  end

  def test_letterify
    assert FactoryHelper::Base.letterify('???').match(/[A-Z]{3}/)
  end

  def test_regexify
    {
      'uk post code' => /^([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)$/,
      'us phone' => /^(1-?)[2-8][0-1][0-9]-\d{3}-\d{4}$/
    }.each do |label, re|
      10.times do
        assert re.match(result = FactoryHelper::Base.regexify(re)), "#{result} is not a match for #{label}"
      end
    end
  end

end
