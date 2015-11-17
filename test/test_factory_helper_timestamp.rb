require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFactoryHelperTimestamp < Test::Unit::TestCase
  def setup
    @tester      = FactoryHelper::Timestamp
    @time_ranges = FactoryHelper::Timestamp::TIME_RANGES
  end

  def test_between
    from = Time.local(2012, 05, 05,  05,  05,  30, 555_555)
    to   = Time.local(2012, 05, 05,  05,  05,  33, 555_555)

    100.times do
      random_time = @tester.between(from, to)
      assert random_time >= from, "Expected >= \"#{from}\", but got #{random_time}"
      assert random_time <= to  , "Expected <= \"#{to}\", but got #{random_time}"
    end
  end

  def test_forward
    now = Time.now
    1_minute_later = Time.now + 1*60

    100.times do
      random_time = @tester.forward(60)
      assert random_time >= now, "Expected >= \"#{now}\", but got #{random_time}"
      assert random_time <= 1_minute_later, "Expected <= \"#{now}\", but got #{random_time}"
    end
  end

  def test_backward
    now = Time.now
    1_minute_earlier = Time.now - 1*60

    100.times do
      random_time = @tester.backward(60)
      assert random_time <= now, "Expected <= \"#{now}\", but got #{random_time}"
      assert random_time >= 1_minute_earlier, "Expected >= \"#{1_minute_earlier}\", but got #{random_time}"
    end
  end

  def test_invalid_period_error
    from = Time.now - 15
    to   = Time.now + 15

    assert_raise ArgumentError do
      @tester.between(from, to, :invalid_period)
    end
  end

  def test_return_type
    random_backward = @tester.backward(30)
    random_between  = @tester.between(Time.now - 30, Time.now + 30)
    random_forward  = @tester.forward(30)

    [random_backward, random_between, random_forward].each do |result|
      assert result.is_a?(Time), "Expected a Time object, but got #{result.class}"
    end
  end

  def test_time_period
    from = Time.now - 60*60*12
    to   = Time.now + 60*60*12

    100.times do
      period          = @time_ranges.keys.to_a.sample
      period_range    = @time_ranges[period]

      random_backward = @tester.backward(60*60*24, period)
      random_between  = @tester.between(from, to, period)
      random_forward  = @tester.forward(60*60*24, period)

      [random_backward, random_between, random_forward].each do |result|
        assert period_range.include?(result.hour.to_i), "\"#{result.hour}\" expected to be included in FactoryHelper::Timestamp::TIME_RANGES[:#{period}] range"
      end
    end
  end
end
