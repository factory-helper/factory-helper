require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFactoryHelperTimestamps < Test::Unit::TestCase
  def setup
    @tester = FactoryHelper::Timestamps
  end

  def test_between
    from = ::Time.local(2012, 05, 05,  05,  05,  30, 222_222.222).round(9)
    to   = ::Time.local(2012, 05, 05,  05,  05,  33, 555_555.555).round(9)

    100.times do
      random_time = @tester.between(from, to)
      assert random_time.to_r > from.to_r, "Expected > \"#{strftime_nsec from}\", but got \"#{strftime_nsec random_time}\""
      assert random_time.to_r < to.to_r  , "Expected < \"#{strftime_nsec to}\", but got \"#{strftime_nsec random_time}\""
      assert random_time == random_time.round(9), "Expected \"#{strftime_nsec random_time}\" to be rounded to 9 digits."
    end
  end

  def test_between_pseudorandom
    from = ::Time.local(2012, 05, 05,  05,  05,  33, 599_992.369).round(9)
    to   = ::Time.local(2012, 05, 05,  05,  05,  33, 599_992.371).round(9)
    expected = ::Time.local(2012, 05, 05,  05,  05,  33, 599_992.370).round(9)

    100.times do
      random_time = @tester.between(from, to)
      assert random_time == expected, "Expected \"#{strftime_nsec expected}\", but got \"#{strftime_nsec random_time}\""
      assert random_time == random_time.round(9), "Expected \"#{strftime_nsec random_time}\" to be rounded to 9 digits."
    end
  end

  def test_forward
    now = ::Time.now.round(9)
    a_minute_later = (now + 1*60).round(9)

    100.times do
      random_time = @tester.forward(now, 60)
      assert random_time > now, "Expected > \"#{strftime_nsec now}\", but got #{strftime_nsec random_time}"
      assert random_time < a_minute_later, "Expected < \"#{strftime_nsec a_minute_later}\", but got \"#{strftime_nsec random_time}\""
      assert random_time == random_time.round(9), "Expected \"#{strftime_nsec random_time}\" to be rounded to 9 digits."
    end
  end

  def test_forward_pseudorandom
    now = ::Time.now.round(9)
    expected = (now + 0.000_000_001).round(9)

    100.times do
      random_time = @tester.forward(now, 0.000_000_002)
      assert random_time == expected, "Expected > \"#{strftime_nsec expected}\", but got \"#{strftime_nsec random_time}\""
      assert random_time == random_time.round(9), "Expected \"#{strftime_nsec random_time}\" to be rounded to 9 digits."
    end
  end

  def test_backward
    now = ::Time.now.round(9)
    a_minute_earlier = (now - 1*60).round(9)

    100.times do
      random_time = @tester.backward(now, 60)
      assert random_time < now, "Expected < \"#{strftime_nsec now}\", but got \"#{strftime_nsec random_time}\""
      assert random_time > a_minute_earlier, "Expected > \"#{strftime_nsec a_minute_earlier}\", but got \"#{strftime_nsec random_time}\""
      assert random_time == random_time.round(9), "Expected \"#{strftime_nsec random_time}\" to be rounded to 9 digits."
    end
  end

  def test_backward_pseudorandom
    now = ::Time.now.round(9)
    expected = (now - 0.000_000_001).round(9)

    100.times do
      random_time = @tester.backward(now, 0.000_000_002)
      assert random_time == expected, "Expected > \"#{strftime_nsec expected}\", but got \"#{strftime_nsec random_time}\""
      assert random_time == random_time.round(9), "Expected \"#{strftime_nsec random_time}\" to be rounded to 9 digits."
    end
  end

  def test_return_type
    now = ::Time.now.round(9)
    random_backward = @tester.backward(now, 30)
    random_between  = @tester.between(now - 30, now + 30)
    random_forward  = @tester.forward(now, 30)

    [random_backward, random_between, random_forward].each do |result|
      assert result.is_a?(Time), "Expected a Time object, but got \"#{result.class}\""
    end
  end

private

  def strftime_nsec value
    value.strftime("%Y-%m-%d %H:%M:%S %9Nnsec %z")
  end

end
