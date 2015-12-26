# frozen_string_literal: true
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
        fetch('address.state').split(' ').map(&:capitalize).join(' ')
      end
    end

  end
end
