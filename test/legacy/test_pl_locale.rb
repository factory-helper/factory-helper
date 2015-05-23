require File.expand_path(File.dirname(__FILE__) + '/../test_helper.rb')

class TestFakerPlLocale < Minitest::Test
  def setup
    @phone_prefixes = %w{12 13 14 15 16 17 18 22 23 24 25 29 32 33 34 41 42 43 44 46 48 52 54 55 56 58 59 61 62 63 65 67 68 71 74 75 76 77 81 82 83 84 85 86 87 89 91 94 95}.sort
    @cell_prefixes = %w{50 51 53 57 60 66 69 72 73 78 79 88}.sort
    FactoryHelper::Config.locale = :pl
  end

  def teardown
    FactoryHelper::Config.locale = nil
  end

  def test_pl_phone_number
    999.times do
      assert_includes @phone_prefixes,
        FactoryHelper::PhoneNumber.phone_number[0,2]
    end
  end

  def test_pl_cell_phone
    999.times do
      assert_includes @cell_prefixes,
        FactoryHelper::PhoneNumber.cell_phone[0,2]
    end
  end
end
