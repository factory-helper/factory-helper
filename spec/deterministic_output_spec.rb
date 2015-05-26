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
end
