module FactoryHelper
  # created for MySQL 5.0 https://dev.mysql.com/doc/refman/5.0/en/numeric-types.html
  class MySQL < Base
    INTEGERS= {
      :tinyint => {
        false => {:min => -128, :max => 127,},
        true => {:min => 0, :max => 255,},
      },
      :smallint => {
        false => {:min => -32768, :max => 32767,},
        true => {:min => 0, :max => 65535,},
      },
      :mediumint => {
        false => {:min => -8388608, :max => 8388607,},
        true => {:min => 0, :max => 16777215,},
      },
      :integer => {
        false => {:min => -2147483648, :max => 2147483647,},
        true => {:min => 0, :max => 4294967295,},
      },
      :bigint => {
        false => {:min => -9223372036854775808, :max => 9223372036854775807,},
        true => {:min => 0, :max => 18446744073709551615,},
      },
    }
    ArgumentError= Class.new(StandardError)

    class << self
      def tinyint opt= {}
        int_sanitize opt
        int_with_edge_cases(int_limits_for :tinyint, opt)
      end

      def smallint opt= {}
        [ tinyint(opt),
          int_with_edge_cases(int_limits_for :smallint, opt),
        ].sample(:random => FactoryHelper::Config.random)
      end

      def mediumint opt= {}
        [ smallint(opt),
          int_with_edge_cases(int_limits_for :mediumint, opt),
        ].sample(:random => FactoryHelper::Config.random)
      end

      def integer opt= {}
        [ mediumint(opt),
          int_with_edge_cases(int_limits_for :integer, opt),
        ].sample(:random => FactoryHelper::Config.random)
      end

      def bigint opt= {}
        [ integer(opt),
          int_with_edge_cases(int_limits_for :bigint, opt),
        ].sample(:random => FactoryHelper::Config.random)
      end

      alias_method :int, :integer

    private

      def int_with_edge_cases opt= {:min => -128, :max => 127}
        [ int_edge_case_for(opt),
          FactoryHelper::Config.random.rand(opt[:min].. opt[:max]),
          FactoryHelper::Config.random.rand(opt[:min].. opt[:max]),
        ].sample(:random => FactoryHelper::Config.random)
      end

      def int_limits_for datatype= :integer, opt= {}
        INTEGERS[datatype][!!opt[:unsigned]].merge(opt)
      end

      def int_edge_case_for opt= {:min => -128, :max => 127}
        [-1, 1, 0, opt[:min], opt[:max]].keep_if do |element|
          (opt[:min].. opt[:max]).include?(element)
        end.sample(:random => FactoryHelper::Config.random)
      end

      def int_sanitize opt
        raise ArgumentError, 'Argument list must be a hash.' unless opt.kind_of? Hash
        raise ArgumentError, 'Must specify a min and a max, or neither.' if !!opt[:min]^ !!opt[:max]
        raise ArgumentError, '`:min` must reference an Integer' if opt[:min]&& !opt[:min].kind_of?(Integer)
        raise ArgumentError, '`:max` must reference an Integer' if opt[:max]&& !opt[:max].kind_of?(Integer)
        raise ArgumentError, "Minimum(#{opt[:min]}) must not be less than zero when unsigned" if (opt[:unsigned]&& opt[:min]&& opt[:min]< 0)
        raise ArgumentError, "Minimum(#{opt[:min]}) must be less than Maximum(#{opt[:max]})" if opt[:min]&& opt[:max]&& (opt[:max]< opt[:min])
      end
    end
  end
end
