# encoding: utf-8
module FactoryHelper
  class Internet < Base
    class << self
      def email(name = nil)
        [ email_word, domain_name ].join('@')
      end

      def free_email(name = nil)
        [ user_name(name), fetch('internet.free_email') ].join('@')
      end

      def safe_email(name = nil)
        [
          user_name(name),
          'example.'+ %w[org com net].
            shuffle(:random => FactoryHelper::Config.random).first
        ].join('@')
      end

      def user_name(specifier = nil, separators = %w(. _))
        if specifier.kind_of? ::String
          return specifier.scan(/\w+/).
            shuffle(:random => FactoryHelper::Config.random).
            join(separators.sample(:random => FactoryHelper::Config.random)).
            downcase
        elsif specifier.kind_of? Integer
          tries = 0 # Don't try forever in case we get something like 1_000_000.
          begin
            result = user_name nil, separators
            tries += 1
          end while result.length < specifier and tries < 7
          until result.length >= specifier
            result = result * 2
          end
          return result
        elsif specifier.kind_of? Range
          tries = 0
          begin
            result = user_name specifier.min, separators
            tries += 1
          end while not specifier.include? result.length and tries < 7
          return result[0...specifier.max]
        end

        fix_umlauts([
          Proc.new { Name.first_name.gsub(/\W/, '').downcase },
          Proc.new {
            [ Name.first_name, Name.last_name ].map {|n|
              n.gsub(/\W/, '')
            }.join(separators.sample(:random => FactoryHelper::Config.random)).downcase }
        ].sample(:random => FactoryHelper::Config.random).call)
      end

      def password(min_length = 8, max_length = 16)
        temp = Lorem.characters(min_length)
        diff_length = max_length - min_length
        if diff_length > 0
          diff_rand = FactoryHelper::Config.random.rand(diff_length + 1)
          temp += Lorem.characters(diff_rand)
        end
        temp = temp[0..min_length] if min_length > 0
        return temp
      end

      def domain_name
        [ fix_umlauts(domain_word), domain_suffix ].join('.')
      end

      def domain_suffix
        fetch('internet.domain_suffix')
      end

      def mac_address(prefix='')
        prefix_digits = prefix.split(':').map{ |d| d.to_i(16) }
        address_digits = (6 - prefix_digits.size).times.map do
          FactoryHelper::Config.random.rand(256)
        end
        (prefix_digits + address_digits).map{ |d| '%02x' % d }.join(':')
      end

      def ip_v4_address
        ary = (2..254).to_a
        [ary.sample(:random => FactoryHelper::Config.random),
        ary.sample(:random => FactoryHelper::Config.random),
        ary.sample(:random => FactoryHelper::Config.random),
        ary.sample(:random => FactoryHelper::Config.random)].join('.')
      end

      def ip_v6_address
        @@ip_v6_space ||= (0..65535).to_a
        container = (1..8).map do |_|
          @@ip_v6_space.sample(:random => FactoryHelper::Config.random)
        end
        container.map{ |n| n.to_s(16) }.join(':')
      end

      def url(host = domain_name, path = "/#{user_name}")
        "http://#{host}#{path}"
      end

      def slug(words = nil, glue = nil)
        glue ||= %w[- _ .].sample(:random => FactoryHelper::Config.random)
        (words || FactoryHelper::Lorem::words(2).join(' ')).gsub(' ', glue).downcase
      end

      def device_token
        FactoryHelper::Config.random.rand(16 ** 64).to_s(16).rjust(64, '0').
          chars.to_a.shuffle(:random => FactoryHelper::Config.random).join
      end

      def fix_umlauts(string= '')
        {"ä" => 'ae', "ö" => 'oe', "ü" => 'ue', "ß" => 'ss'}.each do |key, val|
          string.gsub!(key.downcase, val.downcase)
          string.gsub!(key.upcase, val.upcase)
        end
        string
      end

      def domain_word
        Lorem.word
      end

    private

      def email_word
        name= Name.first_name.downcase
        return name unless name.empty?
        I18n.with_locale('en') do
          return Name.first_name.downcase
        end
      end
    end
  end
end
