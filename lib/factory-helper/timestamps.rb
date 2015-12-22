module FactoryHelper
  class Timestamps < Base

    class << self
      def between(from = ::Time.at(0), to = ::Time.at(2147483647))
        random_time(from, to)
      end

      def forward(from = ::Time.at(0), seconds = 60)
        to = (from + seconds).round(9)
        random_time(from, to)
      end

      def backward(from = ::Time.at(0), seconds = 60)
        to = (from - seconds).round(9)
        random_time(to, from)
      end

    private

      def random_time(from, to) # not inclusive
        diff_time = (to - from).round(9)
        diff_in_nsec = (diff_time * 1_000_000_000).to_i
        rand_in_nsec = FactoryHelper::Config.random.rand(diff_in_nsec-1) + 1 # avoids 0
        rand_in_sec = rand_in_nsec.to_r / 1_000_000_000
        from + rand_in_sec
      end
    end

  end
end
