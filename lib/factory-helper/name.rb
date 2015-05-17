module FactoryHelper
  class Name < Base
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
        include_fallbacks
        fetch('name.female_name')
      end

      def male_name
        include_fallbacks
        fetch('name.male_name')
      end

      # Generate a buzzword-laden job title
      # Wordlist from http://www.bullshitjob.com/title/
      def title
        fetch('name.title.descriptor') + ' ' + fetch('name.title.level') + ' ' + fetch('name.title.job')
      end

    private

      def include_fallbacks
        unless I18n::Backend::Simple.included_modules.include? I18n::Backend::Fallbacks
          I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
        end
        I18n.fallbacks= I18n.fallbacks.merge({'en-US'.to_sym => [:en]})
      end

    end
  end
end
