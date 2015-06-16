RSpec.describe FactoryHelper::MySQL do
  describe 'integers' do
    specify 'tinyint is in-bounds' do
      expect(-128.. 127).to include FactoryHelper::MySQL.tinyint
    end
    specify 'tinyint (unsigned) is in-bounds' do
      expect(0.. 255).to include FactoryHelper::MySQL.tinyint(:unsigned => true)
    end

    specify 'smallint is in-bounds' do
      expect(-32768.. 32767).to include FactoryHelper::MySQL.smallint
    end
    specify 'smallint (unsigned) is in-bounds' do
      expect(0.. 65535).to include FactoryHelper::MySQL.smallint(:unsigned => true)
    end

    specify 'mediumint is in-bounds' do
      expect(-8388608.. 8388607).to include FactoryHelper::MySQL.mediumint
    end
    specify 'mediumint (unsigned) is in-bounds' do
      expect(0.. 16777215).to include FactoryHelper::MySQL.mediumint(:unsigned => true)
    end

    specify 'integer is in-bounds' do
      expect(-2147483648.. 2147483647).to include FactoryHelper::MySQL.integer
    end
    specify 'integer (unsigned) is in-bounds' do
      expect(0.. 4294967295).to include FactoryHelper::MySQL.integer(:unsigned => true)
    end

    specify 'bigint is in-bounds' do
      expect(-9223372036854775808.. 9223372036854775807).to include FactoryHelper::MySQL.bigint
    end
    specify 'bigint (unsigned) is in-bounds' do
      expect(0.. 18446744073709551615).to include FactoryHelper::MySQL.bigint(:unsigned => true)
    end

    specify 'int is in-bounds' do #MySQL aliases INT as INTEGER
      expect(-2147483648.. 2147483647).to include FactoryHelper::MySQL.int
    end
    specify 'int (unsigned) is in-bounds' do #MySQL aliases INT as INTEGER
      expect(0.. 4294967295).to include FactoryHelper::MySQL.int(:unsigned => true)
    end

    %w[tinyint smallint mediumint integer bigint int].each do |int_name|
      ['', ':unsigned => true'].each do |unsigned|
        eval %Q[
          describe '.#{int_name}' do
            context '#{unsigned.empty? ? 'signed' : 'unsigned'}' do
              it 'is an integer' do
                expect(FactoryHelper::MySQL.#{int_name}(#{unsigned})
                ).to be_a_kind_of Integer
              end

              it 'accepts minimum and maximum' do
                expect(100.. 125).to include(
                  FactoryHelper::MySQL.#{int_name}(:min => 100, :max => 125, #{unsigned})
                )
              end

              it 'rejects only a minimum' do
                expect{
                  FactoryHelper::MySQL.#{int_name}(:min => 100, #{unsigned})
                }.to raise_error
              end

              it 'rejects only a maximum' do
                expect{
                  FactoryHelper::MySQL.#{int_name}(:max => 100, #{unsigned})
                }.to raise_error
              end

              it 'accepts no min/max' do
                expect{FactoryHelper::MySQL.#{int_name}(#{unsigned})
                }.to_not raise_error
              end

              it 'rejects non-integer minimum' do
                expect{
                  FactoryHelper::MySQL.#{int_name}(:min => 1.25, :max => 125, #{unsigned})
                }.to raise_error
              end

              it 'rejects non-integer maximum' do
                expect{
                  FactoryHelper::MySQL.#{int_name}(:min => 125, :max => 1.25, #{unsigned})
                }.to raise_error
              end

              it 'rejects min/max mismatch' do
                expect{
                  FactoryHelper::MySQL.#{int_name}(:min => 125, :max => 100, #{unsigned})
                }.to raise_error
              end
            end
          end
        ]
      end

      eval %Q[
        describe 'conflicting arguments' do
          specify 'bounds negative when unsigned' do
            expect{
              FactoryHelper::MySQL.#{int_name}(min: -100, max: -3, unsigned: true)
            }.to raise_error
          end

          specify 'negative maximum when unsigned' do
            expect{
              FactoryHelper::MySQL.#{int_name}(min: 100, max: -3, unsigned: true)
            }.to raise_error
          end

          specify 'unsigned minimum below zero' do
            expect{
              FactoryHelper::MySQL.#{int_name}(min: -100, max: 3, unsigned: true)
            }.to raise_error
          end
        end
      ]
    end
  end
end
