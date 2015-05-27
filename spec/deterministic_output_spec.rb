RSpec.describe 'deterministic output' do

  it 'hey look, it works throughout!' do
    FactoryHelper::Config.seed = 99
    first_output = submodules.map { |sm| module_methods(sm).flatten }
    FactoryHelper::Config.seed = 99
    second_output = submodules.map { |sm| module_methods(sm).flatten }
    FactoryHelper::Config.seed = nil
    third_output = submodules.map { |sm| module_methods(sm).flatten }

    expect(first_output).to eq second_output
    expect(third_output).not_to eq first_output
    expect(third_output & first_output).to be_empty
  end

  private

  def submodules
    FactoryHelper.constants.delete_if do |sm|
      [:Base, :Config, :VERSION].include?(sm)
    end.sort
  end

  def module_methods(submodule)
    submodule_methods = eval("FactoryHelper::#{submodule}.methods(false)").sort
    submodule_methods.map do |method|
      eval("FactoryHelper::#{submodule}.#{method}")
    end
  end
end
