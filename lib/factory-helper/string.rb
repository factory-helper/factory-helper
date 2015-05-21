module FactoryHelper
  class String
    def self.random(length= 32)
      if [Range, Array].include? length.class
        utf8string length.to_a.sample
      else
        utf8string length
      end
    end

  protected

    def self.utf8string(length)
      (1..length.to_i).map do |_|
        [rand(58)+ 32, rand(127), rand(0xd800), rand(0x102000)+ 0xe000].
          sample.chr(Encoding::UTF_8)
      end.join.force_encoding("UTF-8")
    end
  end
end
