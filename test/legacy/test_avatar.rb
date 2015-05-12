require File.expand_path(File.dirname(__FILE__) + '/../test_helper.rb')

class TestFakerAvatar < Test::Unit::TestCase
  def setup
    @tester = Faker::Avatar
  end

  def test_avatar
    assert @tester.image.match(/http:\/\/robohash\.org\/(.+)\.png/)[1] != nil
  end

  def test_avatar_with_param
    assert @tester.image('factory_helper').match(/http:\/\/robohash\.org\/(.+)\.png/)[1] == 'factory_helper'
  end

  def test_avatar_with_correct_size
    assert @tester.image('factory_helper', '150x320').match(/http:\/\/robohash\.org\/factory_helper\.png\?size=(.+)/)[1] == '150x320'
  end

  def test_avatar_with_incorrect_size
    assert_raise ArgumentError do
      @tester.image(nil, '150x320z')
    end
  end

  def test_avatar_with_supported_format
    assert @tester.image('factory_helper', '300x300', 'jpg').match(/http:\/\/robohash\.org\/factory_helper\.jpg/)
  end

  def test_avatar_with_incorrect_format
    assert_raise ArgumentError do
      @tester.image(nil, '300x300', 'wrong_format')
    end
  end

end
