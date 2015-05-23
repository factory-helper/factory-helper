require File.dirname(__FILE__) + '/test_helper.rb'

class TestFactoryHelperStreet < Minitest::Test
  def setup

    I18n.reload!
    shire = {
      :factory_helper => {
        :address => {
          :street_name => ['#{street_prefix} #{street_root} #{street_suffix}'],
          :street_prefix => ["Wide"],
          :street_root => ["Cheerful"],
          :street_suffix => ["Path"],
          :secondary_address => ["(Green Door)"],
          :street_address => ['#{street_name} #{building_number}'],
          :building_number => ["#"],
          :time_zone => ["Pacific/Pago_Pago"],
        }
      }
    }
    I18n.backend.store_translations(:shire, shire)
  end

  def test_street_name_supports_flexible_formats
    I18n.with_locale(:shire) do
      assert_equal "Wide Cheerful Path", FactoryHelper::Address.street_name
    end
  end

  def test_street_address_supports_flexible_formats
    I18n.with_locale(:shire) do
      assert_match(/Wide Cheerful Path \d/, FactoryHelper::Address.street_address)
    end
  end

  def test_street_address_optionally_provides_secondary_address
    I18n.with_locale(:shire) do
      assert_match(/Wide Cheerful Path \d \(Green Door\)/, FactoryHelper::Address.street_address(:include_secondary))
    end
  end

  def test_street_address_with_locale_fallback
    I18n.with_locale('en-GB') do
      assert_match(/^\d+ [\w']+ \w+/, FactoryHelper::Address.street_address)
    end
  end

  def test_timezone_support
    I18n.with_locale(:shire) do
      assert_equal "Pacific/Pago_Pago", FactoryHelper::Address.time_zone
    end
  end

end
