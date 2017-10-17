# frozen_string_literal: true
module FactoryHelper
  class SlackEmoji < Base
    class << self

      def people
        fetch('slack_emoji.people')
      end

      def nature
        fetch('slack_emoji.nature')
      end

      def food_and_drink
        fetch('slack_emoji.food_and_drink')
      end

      def activity
        fetch('slack_emoji.activity')
      end

      def travel_and_places
        fetch('slack_emoji.travel_and_places')
      end

      def objects
        fetch('slack_emoji.objects')
      end

      def symbols
        fetch('slack_emoji.symbols')
      end

      def flags
        fetch('slack_emoji.flags')
      end

      def custom
        fetch('slack_emoji.custom')
      end

      def emoji
        parse('slack_emoji.emoji')
      end

    end
  end
end
