module FactoryHelper
  class Timestamps < Time
    class << self

    private

      def random_time(period)
        super(period) + microseconds
      end

      def microseconds
        FactoryHelper::Config.random.rand(1_000_000).to_f/1_000_000
      end
    end
  end
end
