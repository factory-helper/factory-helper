# frozen_string_literal: true
module FactoryHelper
  class Name < Base
    flexible :name

    class << self

      def name
        parse('name.name')
      end

      def first_name
        parse('name.first_name')
      end

      def last_name
        fetch('name.last_name')
      end

      def prefix
        fetch('name.prefix')
      end

      def suffix
        fetch('name.suffix')
      end

      def female_first_name
        fetch('name.female_first_name')
      end

      def male_first_name
        fetch('name.male_first_name')
      end

      # Generate a buzzword-laden job title
      # Wordlist from http://www.bullshitjob.com/title/
      def title
        fetch('name.title.descriptor') + ' ' + fetch('name.title.level') + ' ' + fetch('name.title.job')
      end

    end
  end
end
