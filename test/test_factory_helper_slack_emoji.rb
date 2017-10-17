# frozen_string_literal: true
require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFactoryHelperSlackEmoji < Test::Unit::TestCase

  def setup
    @tester = FactoryHelper::SlackEmoji
    @emoticon_regex= /^(?::(?:[-\w+]+):)+$/
  end

  def test_people
    assert @tester.people.match(@emoticon_regex)
  end

  def test_nature
    assert @tester.nature.match(@emoticon_regex)
  end

  def test_food_and_drink
    assert @tester.food_and_drink.match(@emoticon_regex)
  end

  def test_activity
    assert @tester.activity.match(@emoticon_regex)
  end

  def test_travel_and_places
    assert @tester.travel_and_places.match(@emoticon_regex)
  end

  def test_objects
    assert @tester.objects.match(@emoticon_regex)
  end

  def test_symbols
    assert @tester.symbols.match(@emoticon_regex)
  end

  def test_flags
    assert @tester.flags.match(@emoticon_regex)
  end

  def test_custom
    assert @tester.custom.match(@emoticon_regex)
  end

  def test_emoji
    assert @tester.emoji.match(@emoticon_regex)
  end
end
