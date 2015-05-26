module FactoryHelper
  class String
    def self.random(length= 32)
      if length.class.included_modules.include? Enumerable
        utf8string length.to_enum.to_a.sample(:random => FactoryHelper::Config.random)
      else
        utf8string length
      end
    end

  protected

    def self.utf8string(length)
      (1..length.to_i).map do |_|
        characters.sample(:random => FactoryHelper::Config.random).chr(Encoding::UTF_8)
      end.join.force_encoding("UTF-8")
    end

    def self.characters
      [
        FactoryHelper::Config.random.rand(59)+ 32,          # latin alphabet
        FactoryHelper::Config.random.rand(128),             # 7-bit ASCII
        FactoryHelper::Config.random.rand(0xd800),          # utf-8 codepoints below utf-16 surrogate halves
        FactoryHelper::Config.random.rand(0x102000)+ 0xe000 # utf-8 codepoints above utf-16 surrogate halves
      ]
    end
  end
end
