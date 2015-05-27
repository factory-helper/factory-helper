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
    p submodules
    p module_methods(:String)
    # FactoryHelper::Config.seed = 99
    # all_output = []
    # all_output << submodules.each do |sm|
    #   module_methods(sm)
    # end
    # p all_output
  end

  private

  def submodules
    submodules = FactoryHelper.constants.delete_if do |sm|
      [:Base, :Config, :VERSION].include?(sm)
    end
  end

  def module_methods(submodule)
    submodule_output = []
    submodule_methods = eval("FactoryHelper::#{submodule}.methods(false)")
    submodule_methods.each do |method|
      submodule_output << eval("FactoryHelper::#{submodule}.#{method}")
    end
    return submodule_output
  end
end
