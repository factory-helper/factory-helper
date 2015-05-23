require File.dirname(__FILE__) + '/../test_helper.rb'

module Faker
  class FoodieFaker < Base
    flexible :chow
  end
end

class TestFakerFlexible < Minitest::Test

  def setup
    I18n.reload!
    I18n.backend.store_translations(:xx, :factory_helper => {:chow => {:yummie => [:fudge, :chocolate, :caramel], :taste => "delicious"}})
    I18n.backend.store_translations(:home, :factory_helper => {:address => {:birthplace => [:bed, :hospital, :airplane]}})
    I18n.backend.store_translations(:kindergarden, :factory_helper => {:name => {:girls_name => [:alice, :cheryl, :tatiana]}})
    I18n.backend.store_translations(:work, :factory_helper => {:company => {:do_stuff => [:work, :work, :work]}})
  end

  def test_flexible_multiple_values
    I18n.with_locale(:xx) do
      actual = Faker::FoodieFaker.yummie
      assert [:fudge, :chocolate, :caramel].include? actual
    end
  end

  def test_flexible_single_value
    I18n.with_locale(:xx) do
      assert_equal "delicious", Faker::FoodieFaker.taste
    end
  end

  def test_raises_no_method_error
    I18n.with_locale(:xx) do
      assert_raises(NoMethodError) do
        Faker::FoodieFaker.eeew
      end
    end
  end

  def test_address_is_flexible
    I18n.with_locale(:home) do
      assert [:bed, :hospital, :airplane].include? Faker::Address.birthplace
    end
  end

  def test_name_is_flexible
    I18n.with_locale(:kindergarden) do
      assert [:alice, :cheryl, :tatiana].include? Faker::Name.girls_name
    end
  end

  def test_company_is_flexible
    I18n.with_locale(:work) do
      assert Faker::Company.do_stuff == :work
    end
  end
end
