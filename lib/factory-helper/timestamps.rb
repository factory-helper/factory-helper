module FactoryHelper
  class Timestamps
    class << self

      def between(from, to)
        random_time(from, to)
      end

      def forward(seconds= 60)
        from = ::Time.now
        to = from + seconds
        random_time(from, to)
      end

      def backward(seconds= 60)
        to = ::Time.now
        from = to - seconds
        random_time(from, to)
      end

    private

      def random_time(from, to)
        diff_time = to - from
        dif_in_usec = (diff_time * 1_000_000).to_i
        rand_in_usec = FactoryHelper::Config.random.rand(dif_in_usec-1) + 1 # avoids 0
        rand_in_sec = rand_in_usec.to_f / 1_000_000
        from + rand_in_sec
      end

    end
  end
end




# module FactoryHelper
#   class Timestamps < Time
#     class << self

#     private

#       def random_time(period)
#         super(period) + microseconds
#       end

#       def microseconds
#         FactoryHelper::Config.random.rand(1_000_000).to_f/1_000_000
#       end
#     end
#   end
# end


# module FactoryHelper
#   class Time < Date
#     TIME_RANGES = {
#       :all => (0..23),
#       :day => (9..17),
#       :night => (18..23),
#       :morning => (6..11),
#       :afternoon => (12..17),
#       :evening => (17..21),
#       :midnight => (0..4)
#     }

#     class << self

#       def between(from=::Time.at(0), to=::Time.now, period = :all)
#         super(from, to).to_time + random_time(period)
#       end

#       def forward(days = 365, period = :all)
#         super(days).to_time + random_time(period)
#       end

#       def backward(days = 365, period = :all)
#         super(days).to_time + random_time(period)
#       end

#       private

#       def random_time(period)
#         hours(period) + minutes + seconds
#       end

#       def hours(period)
#         raise ArgumentError, 'invalid period' unless TIME_RANGES.has_key? period
#         hour_at_period = TIME_RANGES[period].to_a.sample(:random => FactoryHelper::Config.random)

#         (60 * 60 * hour_at_period)
#       end

#       def minutes
#         60 * seconds
#       end

#       def seconds
#         (0..59).to_a.sample(:random => FactoryHelper::Config.random)
#       end
#     end
#   end
# end
