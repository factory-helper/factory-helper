# frozen_string_literal: true
module FactoryHelper
  class Number < Base
    class << self
      def number(digits=10)
        (1..digits).collect {digit}.join
      end

      def decimal(l_digits=5, r_digits = 2)
        l_d = self.number(l_digits)
        r_d = self.number(r_digits)
        "#{l_d}.#{r_d}"
      end

      def digit
        (FactoryHelper::Config.random.rand() * 9).round.to_s
      end

      def hexadecimal(digits=6)
        hex = ""
        digits.times { hex += FactoryHelper::Config.random.rand(15).to_s(16) }
        hex
      end

      def between(from = 1.00, to = 5000.00)
        FactoryHelper::Base::rand_in_range(from, to)
      end

      def positive(from = 1.00, to = 5000.00)
        random_number = between(from, to)
        greater_than_zero(random_number)
      end

      def negative(from = -5000.00, to = -1.00)
        random_number = between(from, to)
        less_than_zero(random_number)
      end

      private

      def greater_than_zero(number)
        should_be(number, :>)
      end

      def less_than_zero(number)
        should_be(number, :<)
      end

      def should_be(number, method_to_compare)
        if number.send(method_to_compare, 0)
          number
        else
          number * -1
        end
      end
    end
  end
end
