module FactoryHelper
  class String
    class << self
      def random(length= 32)
          utf8string select_a length
      end

    private

      def select_a length
        if length.class.included_modules.include? Enumerable
          select_a length.to_enum.to_a.sample(:random => FactoryHelper::Config.random)
        else
          length
        end
      end

      def utf8string(length)
        (1..length.to_i).map{ space_or_utf8_char }.join
      end

      def space_or_utf8_char
        [" ", [utf8character]*5].flatten.sample(:random => FactoryHelper::Config.random)
      end

      def utf8character
        [
          FactoryHelper::Config.random.rand(59)+ 32,          # latin alphabet
          FactoryHelper::Config.random.rand(128),             # 7-bit ASCII
          FactoryHelper::Config.random.rand(0xd800),          # utf-8 codepoints below utf-16 surrogate halves
          FactoryHelper::Config.random.rand(0x102000)+ 0xe000 # utf-8 codepoints above utf-16 surrogate halves
        ].sample(:random => FactoryHelper::Config.random).chr(Encoding::UTF_8)
      end
    end
  end
end
