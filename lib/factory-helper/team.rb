module FactoryHelper
  class Team < Base
    flexible :team

    class << self
      def name
        parse('team.name')
      end

      def creature
        fetch('team.creature')
      end

      def state
        fetch('factory_helper.address.state').titleize
      end
    end

  end
end
