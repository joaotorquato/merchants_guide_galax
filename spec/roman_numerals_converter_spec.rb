require 'spec_helper'

RSpec.describe RomanNumeralConverter, '#convert' do
  let(:converter) { RomanNumeralConverter.new }

  it 'calculates the decimal for I' do
    expect(converter.roman_to_decimal('I')).to eq 1
  end

  it 'calculates the decimal for IV' do
    expect(converter.roman_to_decimal('IV')).to eq 4
  end

  it 'calculates the decimal for XXIV' do
    expect(converter.roman_to_decimal('XXIV')).to eq 24
  end

  it 'calculates the decimal for MMMCM' do
    expect(converter.roman_to_decimal('MMMCM')).to eq 3900
  end

  it 'calculates the decimal for XXXIX' do
    expect(converter.roman_to_decimal('XXXIX')).to eq 39
  end

  context 'when there are new numerals for the roman dicionary' do
    it 'maps glob for I' do
      converter = RomanNumeralConverter.new(glob: 'I')
      expect(converter.roman_to_decimal('glob')).to eq 1
    end

    it 'maps glob for I and prok for V' do
      converter = RomanNumeralConverter.new(glob: 'I', prok: 'V')
      expect(converter.roman_to_decimal('glob prok')).to eq 4
    end
  end
end
