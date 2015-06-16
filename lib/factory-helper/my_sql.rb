module FactoryHelper
  # created for MySQL 5.0  https://dev.mysql.com/doc/refman/5.0/en/numeric-types.html
  class MySQL < Base
    class << self
      def int(opt= {});integer(opt);end

      def tinyint opt= {}
        if int_sanitize(opt)[:unsigned]
          int_with_edge_cases({:min => 0, :max => 255}.merge(opt))
        else
          int_with_edge_cases({:min => -128, :max => 127}.merge(opt))
        end
      end

      def smallint opt= {}
        [tinyint(opt), if opt[:unsigned]
          int_with_edge_cases({:min => 0, :max => 65535}.merge(opt))
        else
          int_with_edge_cases({:min => -32768, :max => 32767}.merge(opt))
        end].sample(:random => FactoryHelper::Config.random)
      end

      def mediumint opt= {}
        [smallint(opt), if opt[:unsigned]
          int_with_edge_cases({:min => 0, :max => 16777215}.merge(opt))
        else
          int_with_edge_cases({:min => -8388608, :max => 8388607}.merge(opt))
        end].sample(:random => FactoryHelper::Config.random)
      end

      def integer opt= {}
        [mediumint(opt), if opt[:unsigned]
          int_with_edge_cases({:min => 0, :max => 4294967295}.merge(opt))
        else
          int_with_edge_cases({:min => -2147483648, :max => 2147483647}.merge(opt))
        end].sample(:random => FactoryHelper::Config.random)
      end

      def bigint opt= {}
        [integer(opt), if opt[:unsigned]
          int_with_edge_cases({:min => 0, :max => 18446744073709551615}.merge(opt))
        else
          int_with_edge_cases({:min => -9223372036854775808, :max => 9223372036854775807}.merge(opt))
        end].sample(:random => FactoryHelper::Config.random)
      end

    private

      def int_with_edge_cases opt= {:min => -128, :max => 127}
        [ [-1, 1, 0, opt[:min], opt[:max]].keep_if do |element|
            (opt[:min].. opt[:max]).include?(element)
          end.sample(:random => FactoryHelper::Config.random),
          FactoryHelper::Config.random.rand(opt[:min].. opt[:max])
        ].compact.sample(:random => FactoryHelper::Config.random)
      end

      def int_sanitize opt
        check_bounds opt.tap { raise 'Argument list must be a hash.' unless opt.kind_of? Hash
        raise 'Must specify a min and a max, or neither.' if !!opt[:min]^ !!opt[:max]
        raise '`:min` must reference an integer' if opt[:min]&& !opt[:min].kind_of?(Integer)
        raise '`:max` must reference an integer' if opt[:max]&& !opt[:max].kind_of?(Integer)
        raise "Minimum(#{opt[:min]}) must be less than Maximum(#{opt[:max]})" if opt[:min]&& opt[:max]&& (opt[:max]< opt[:min]) }
      end

      def check_bounds opt
        if opt[:unsigned]&& opt[:min]&& opt[:min]< 0
          raise "Minimum(#{opt[:min]}) must not be less than zero when unsigned"
        end
        opt
      end
    end
  end
end
