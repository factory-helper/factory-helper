RSpec.describe FactoryHelper::Config do
  describe 'PRNG' do
    specify '.random.seed' do
      expect(FactoryHelper::Config.random.seed).to eq FactoryHelper::Config.seed
    end

    specify 'use Random for entropy' do
      expect(Random).to receive(:new_seed)
      FactoryHelper::Config.seed= nil
    end

    #use two entropy sources because "Starting with Unicorn 3.6.1, we have builtin workarounds for Kernel#rand and OpenSSL::Random users, but applications may use other PRNGs."
    specify 'use Kernel.rand for entropy' do
      expect(Kernel).to receive(:rand)
      FactoryHelper::Config.seed= nil
    end
  end
end
