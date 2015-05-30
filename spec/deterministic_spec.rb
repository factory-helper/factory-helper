require 'test_run'

RSpec.describe 'determinism' do
  describe 'same seed' do
    FactoryHelper::Config.seed= 42
    TestRun.only_instance.all_methods.each_index do |index|
      eval %Q[
        specify "#{TestRun.only_instance.all_methods[index]} resolves" do
          expect{TestRun.only_instance.store index, TestRun.only_instance.all_methods[index]}.to_not raise_error
        end
      ]
    end
    FactoryHelper::Config.seed= 42
    TestRun.only_instance.all_methods.each_index do |index|
      eval %Q[
        specify "#{TestRun.only_instance.all_methods[index]} is deterministic" do
          expect(TestRun.only_instance.first_run[index]).to eq eval(TestRun.only_instance.all_methods[index])
        end
      ]
    end
  end
end
