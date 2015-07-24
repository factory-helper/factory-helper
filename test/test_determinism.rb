require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestDeterminism < Test::Unit::TestCase

  def setup
    @all_methods= all_methods.freeze
    @first_run= []
  end

  def test_determinism
    FactoryHelper::Config.set_seed 42
    @all_methods.each_index do |index|
      store_result @all_methods[index]
    end
    @first_run.freeze
    FactoryHelper::Config.set_seed 42
    @all_methods.each_index do |index|
      assert deterministic_random? @first_run[index], @all_methods[index]
    end
  end

private

  def deterministic_random? first, method_name
    second= eval(method_name)
    (first== second) || raise(
      "#{method_name} has an entropy leak; use "<<
      '"FactoryHelper::Config.random.rand"'
    )
  end

  def store_result method_name
    begin
      @first_run<< eval(method_name)
    rescue => exception
      raise %Q[#{method_name} raised "#{exception}"]
    end
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
