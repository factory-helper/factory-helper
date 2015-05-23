require File.dirname(__FILE__) + '/test_helper.rb'

class TestFactoryHelperCity < Minitest::Test
  def setup
    I18n.reload!
    xx = {
      :factory_helper => {
        :name => {:first_name => ['alice'], :last_name => ['smith']},
        :address => {:city_prefix => ['west'], :city_suffix => ['burg']}
      }
    }
    I18n.backend.store_translations(:xx, xx)

    xy = {
      :factory_helper => {
        :address => {
          :city_prefix => ['big'],
          :city_root => ['rock'],
          :city_root_suffix => ['ing'],
          :city_suffix => ['town'],
          :city => ['#{city_prefix} #{city_root}#{city_root_suffix} #{city_suffix}']
        }
      }
    }
    I18n.backend.store_translations(:xy, xy)
  end

  def test_default_city_formats
    I18n.with_locale(:xx) do
      100.times do
        cities = ["west alice", "west smith", "west aliceburg", "west smithburg", "aliceburg", "smithburg"]
        city = FactoryHelper::Address.city
        assert cities.include?(city), "Expected <#{cities.join(' / ')}>, but got #{city}"
      end
    end
  end

  def test_city_formats_are_flexible
    I18n.with_locale(:xy) do
      cities = ['big rocking town']
      city = FactoryHelper::Address.city
      assert cities.include?(city), "Expected <#{cities.join(' / ')}>, but got #{city}"
    end
  end

end
