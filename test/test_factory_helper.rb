require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFactoryHelper < Test::Unit::TestCase

  def setup
    @all_methods= all_methods.freeze
    @first_run= []
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

  def test_determinism
    FactoryHelper::Config.seed= 42
    @all_methods.each do |method_name|
      store method_name
    end
    @first_run.freeze
    FactoryHelper::Config.seed= 42
    @all_methods.each_index do |index|
      assert assert_deterministic_random @first_run[index], @all_methods[index]
    end
  end

private

  def store method_name
    begin
      @first_run << eval(method_name)
    rescue => e
      raise "#{method_name} raised #{e}"
    end
  end

  def assert_deterministic_random first, method
    second= eval(method)
    (first== second) || raise("#{method} has an entropy leak; use "<< 'FactoryHelper::Config.random.rand')
  end

  def all_methods
    subclasses.map do |subclass|
      subclass_methods(subclass).flatten
    end.flatten.sort
  end

  def subclasses
    FactoryHelper.constants.delete_if do |subclass|
      [:Base, :Config, :VERSION].include?(subclass)
    end.sort
  end

  def subclass_methods(subclass)
    eval("FactoryHelper::#{subclass}.methods(false)").sort.map do |method|
      "FactoryHelper::#{subclass}.#{method}"
    end.sort
  end
end
