# frozen_string_literal: true
module FactoryHelper
  class Time < Date
    TIME_RANGES = {
      :all => (0..23),
      :day => (9..17),
      :night => (18..23),
      :morning => (6..11),
      :afternoon => (12..17),
      :evening => (17..21),
      :midnight => (0..4)
    }

    class << self

      def between(from=::Time.at(0), to=::Time.now, period = :all)
        super(from, to).to_time + random_time(period)
      end

      def forward(days = 365, period = :all)
        super(days).to_time + random_time(period)
      end

      def backward(days = 365, period = :all)
        super(days).to_time + random_time(period)
      end

      private

      def random_time(period)
        hours(period) + minutes + seconds
      end

      def hours(period)
        raise ArgumentError, 'invalid period' unless TIME_RANGES.has_key? period
        hour_at_period = TIME_RANGES[period].to_a.sample(:random => FactoryHelper::Config.random)

        (60 * 60 * hour_at_period)
      end

      def minutes
        60 * seconds
      end

      def seconds
        (0..59).to_a.sample(:random => FactoryHelper::Config.random)
      end
    end
  end
end
