require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFactoryHelperTimestamps < Test::Unit::TestCase
  def setup
    @tester = FactoryHelper::Timestamps
  end

  def test_between
    from = ::Time.local(2012, 05, 05,  05,  05,  30, 222_222.222)
    to   = ::Time.local(2012, 05, 05,  05,  05,  33, 555_555.555)

    100.times do
      random_time = @tester.between(from, to)
      assert random_time.to_r > from.to_r, "Expected > \"#{from.to_r}\", but got #{random_time.to_r}"
      assert random_time.to_r < to.to_r  , "Expected < \"#{to.to_r}\", but got #{random_time.to_r}"
    end
  end

  def test_forward
    now = ::Time.now
    a_minute_later = now + 1*60

    100.times do
      random_time = @tester.forward(now, 60)
      assert random_time > now, "Expected > \"#{now}\", but got #{random_time}"
      assert random_time < a_minute_later, "Expected < \"#{a_minute_later}\", but got #{random_time}"
    end
  end

  def test_backward
    now = ::Time.now
    a_minute_earlier = now - 1*60

    100.times do
      random_time = @tester.backward(now, 60)
      assert random_time < now, "Expected < \"#{now}\", but got #{random_time}"
      assert random_time > a_minute_earlier, "Expected > \"#{a_minute_earlier}\", but got #{random_time}"
    end
  end

  def test_return_type
    now = ::Time.now
    random_backward = @tester.backward(now, 30)
    random_between  = @tester.between(now - 30, now + 30)
    random_forward  = @tester.forward(now, 30)

    [random_backward, random_between, random_forward].each do |result|
      assert result.is_a?(Time), "Expected a Time object, but got #{result.class}"
    end
  end

end
