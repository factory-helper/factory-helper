RSpec.describe 'deterministic output' do

  specify 'FactoryHelper can be seeded for deterministic output' do
    FactoryHelper::Config.seed = 99
    seeded_output1 = FactoryHelper::Company.catch_phrase
    FactoryHelper::Config.seed = 99
    seeded_output2 = FactoryHelper::Company.catch_phrase

    expect(seeded_output1).to eq seeded_output2
  end

  specify 'seed can be nullified to return to random' do
    FactoryHelper::Config.seed = 99
    seeded_output1 = FactoryHelper::Company.catch_phrase
    FactoryHelper::Config.seed = nil
    unseeded_output = FactoryHelper::Company.catch_phrase

    expect(seeded_output1).not_to eq unseeded_output
  end

  it 'does' do
    FactoryHelper::Config.seed = 99
    first_output = submodules.map { |sm| module_methods(sm).flatten }
    FactoryHelper::Config.seed = 99
    second_output = submodules.map { |sm| module_methods(sm).flatten }

    # expect(first_output).to eq second_output
    p second_output - (second_output & first_output)
    p first_output - (second_output & first_output)
  end

  private

  def submodules
    submodules = FactoryHelper.constants.delete_if do |sm|
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
