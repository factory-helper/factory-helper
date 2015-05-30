RSpec.describe 'deterministic output' do

  specify 'hey look, it works throughout!' do
    expect(all_api_output_with_seed(99)).to eq all_api_output_with_seed(99)

    expect(all_api_output_with_seed(99)).not_to eq all_api_output_with_seed(98)

    expect(all_api_output_with_seed(99) & all_api_output_with_seed(98)).
      to be_empty
  end

  private

  def all_api_output_with_seed(seed)
    FactoryHelper::Config.seed = seed
    subclasses.map { |sc| subclass_methods(sc).flatten }
  end

  def subclasses
    FactoryHelper.constants.delete_if do |sc|
      [:Base, :Config, :VERSION].include?(sc)
    end.sort
  end

  def subclass_methods(subclass)
    subclass_methods = eval("FactoryHelper::#{subclass}.methods(false)").sort
    subclass_methods.map do |method|
      eval("FactoryHelper::#{subclass}.#{method}")
    end
  end
end
