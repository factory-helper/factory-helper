# frozen_string_literal: true
module FactoryHelper
  class Company < Base
    flexible :company

    class << self
      def name
        parse('company.name')
      end

      def suffix
        fetch('company.suffix')
      end

      # Generate a buzzword-laden catch phrase.
      def catch_phrase
        translate('factory_helper.company.buzzwords').collect {|list| list.sample(:random => FactoryHelper::Config.random) }.join(' ')
      end

      def buzzword
        translate('factory_helper.company.buzzwords').flatten.sample(:random => FactoryHelper::Config.random)
      end

      # When a straight answer won't do, BS to the rescue!
      def bs
        translate('factory_helper.company.bs').collect {|list| list.sample(:random => FactoryHelper::Config.random) }.join(' ')
      end

      def ein
        ('%09d' % FactoryHelper::Config.random.rand(10 ** 9)).gsub(/(\d\d)(\d\d\d\d\d\d\d)/, '\\1-\\2')
      end

      def duns_number
        ('%09d' % FactoryHelper::Config.random.rand(10 ** 9)).gsub(/(\d\d)(\d\d\d)(\d\d\d\d)/, '\\1-\\2-\\3')
      end

      # Get a random company logo url in PNG format.
      def logo
        rand_num = FactoryHelper::Config.random.rand(13) + 1
        "http://pigment.github.io/fake-logos/logos/medium/color/#{rand_num}.png"
      end
    end

  end
end
