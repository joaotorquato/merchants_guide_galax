require 'spec_helper'

RSpec.describe Metal, '#convert' do
  context 'should return the total price of the metal' do
    it 'should return the total of 68.00' do
      roman_converter = RomanNumeralConverter.new(glob: 'I', prok: 'V')
      metal = Metal.new([{ quantity: 'glob glob',
                           metal: 'Silver',
                           total_price: 34 }],
                        roman_converter)
      expect(metal.calculate('glob prok Silver')).to eq 68.00
    end

    it 'should return the total of 68.00' do
      roman_converter = RomanNumeralConverter.new(glob: 'I', prok: 'V')
      metal = Metal.new([{ quantity: 'glob glob',
                           metal: 'Silver',
                           total_price: 34 },
                         { quantity: 'glob prok',
                           metal: 'Gold',
                           total_price: 57_800 }],
                        roman_converter)
      expect(metal.calculate('glob prok Silver')).to eq 68.00
    end
  end
end
