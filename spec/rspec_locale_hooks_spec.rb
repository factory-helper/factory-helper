RSpec.describe 'RSpec locale hooks', :order => :defined do

  before(:all) do
    I18n.reload!
    @original_locale = I18n.locale
    I18n.backend.store_translations(:ankh, :factory_helper => {})
    I18n.locale = :ankh
  end

  after(:all) do
    I18n.reload!
    I18n.locale = @original_locale
  end

  specify 'locale defaults to I18n if not declared explicitly' do
    expect(FactoryHelper::Config.locale).to eq :ankh
  end

  specify 'locale can be set within an example' do
    FactoryHelper::Config.locale = :morpork

    expect(FactoryHelper::Config.locale).to eq :morpork
  end

  specify 'locale reverts to I18n after each example' do
    expect(FactoryHelper::Config.locale).to eq :ankh
  end
end
