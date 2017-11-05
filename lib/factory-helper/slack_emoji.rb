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

      def objects_and_symbols
        warn '[DEPRECATION] "FactoryHelper::SlackEmoji.objects_and_symbols" is deprecated. Please use "FactoryHelper::SlackEmoji.objects" or "FactoryHelper::SlackEmoji.symbols" instead.'
        parse('slack_emoji.objects_and_symbols')
      end

      def celebration
        warn '[DEPRECATION] "FactoryHelper::SlackEmoji.celebration" is deprecated. Please use "FactoryHelper::SlackEmoji.objects" or "FactoryHelper::SlackEmoji.symbols" instead.'
        parse('slack_emoji.objects_and_symbols')
      end
    end
  end
end
