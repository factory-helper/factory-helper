class TestRun < Object
  @@instance= false
  attr_reader :first_run
  attr_reader :all_methods

  def self.only_instance
    @@instance||= self.new
  end

  def initialize
    @all_methods= all__methods.freeze
    @first_run= Hash.new
  end

  #def seed= obj
  #  Object::FactoryHelper::Config.seed= obj
  #end

  def store index, method_name
    begin
      @first_run[index]= eval(method_name)
    rescue => e
      raise "#{method_name} raised #{e}"
    end
  end

private

  def all__methods
    subclasses.map do |subclass|
      subclass_methods(subclass)
    end.flatten
  end

  def subclasses
    Object::FactoryHelper.constants.delete_if do |subclass|
      [:Base, :Config, :VERSION].include?(subclass)
    end.sort
  end

  def subclass_methods(subclass)
    eval("Object::FactoryHelper::#{subclass}.methods(false)").sort.map do |method_name|
      "Object::FactoryHelper::#{subclass}.#{method_name}"
    end
  end
end
