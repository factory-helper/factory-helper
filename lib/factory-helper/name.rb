module FactoryHelper
  class Name < Base
    EN_LOCALES= [:en, 'en-AU'.to_sym, 'en-au-ocker'.to_sym, 'en-BORK'.to_sym, 'en-CA'.to_sym, 'en-GB'.to_sym, 'en-IND'.to_sym, 'en-NEP'.to_sym, 'en-US'.to_sym]
    flexible :name

    class << self

      def name
        parse('name.name')
      end

      def first_name
        fetch('name.first_name')
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

      def female_name
        fetch('name.female_name')
      end

      def male_name
        fetch('name.male_name')
      end

      # Generate a buzzword-laden job title
      # Wordlist from http://www.bullshitjob.com/title/
      def title
        fetch('name.title.descriptor') + ' ' + fetch('name.title.level') + ' ' + fetch('name.title.job')
      end

    end
  end
end
