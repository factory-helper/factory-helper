require 'spec_helper'

RSpec.describe FactoryHelper::String do
  describe '.random' do
    specify 'is String' do
      expect(FactoryHelper::String.random).to be_a_kind_of String
    end

    specify 'is valid' do
      expect(FactoryHelper::String.random.valid_encoding?).to be_truthy
    end

    specify 'default encoding' do
      expect(FactoryHelper::String.random.encoding.to_s).to eq 'UTF-8'
    end

    specify 'default length' do
      expect(FactoryHelper::String.random.length).to eq 32
    end

    describe 'length' do
      specify 'nil' do
        expect(FactoryHelper::String.random(nil).length).to eq 32
      end

      specify 'integer' do
        length= [0, -1, 1, rand(500), rand(4096)- 2048].sample
        expect(FactoryHelper::String.random(length).length).to eq [0, length].max
      end

      context 'range' do
        specify 'is accepted' do
          range= (-5..30)
          expect(range).to include FactoryHelper::String.random(range).length
        end

        specify 'is used' do
          range= (42..42)
          expect(FactoryHelper::String.random(range).length).to eq 42
        end
      end

      context 'array' do
        specify 'is accepted' do
          array= [0, -1, 1, 1024, rand(2048)]
          expect(array).to include (FactoryHelper::String.random(array).length)
        end

        specify 'is used' do
          num= rand(4096)- 2048
          array= [num, num, num]
          expect(FactoryHelper::String.random(array).length).to eq [0, num].max
        end
      end
    end
  end
end
