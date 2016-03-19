require 'spec_helper'

RSpec.describe RomanNumeralConverter, '#convert' do
  let(:converter) { RomanNumeralConverter.new }

  it 'calculates the decimal for I' do
    expect(converter.convert_roman('I'.split(''))).to eq 1
  end
  it 'calculates the decimal for IV' do
    expect(converter.convert_roman('IV'.split(''))).to eq 4
  end
  it 'calculates the decimal for XXIV' do
    expect(converter.convert_roman('XXIV'.split(''))).to eq 24
  end
  it 'calculates the decimal for MMMCM' do
    expect(converter.convert_roman('MMMCM'.split(''))).to eq 3900
  end
  it 'calculates the decimal for XXXIX' do
    expect(converter.convert_roman('XXXIX'.split(''))).to eq 39
  end
end

RSpec.describe RomanNumeralConverter, '#map_words_into_roman_hash' do
  let(:converter) { RomanNumeralConverter.new }

  context 'Map new words to roman numerals' do
    it 'maps glob for I' do
      converter.map_words_into_roman_hash(glob: 'I')
      expect(converter.map.invert['glob']).to eq 1
    end

    it 'maps glob for I and prok for V' do
      converter.map_words_into_roman_hash(glob: 'I', prok: 'V')
      expect(converter.map.invert['glob']).to eq 1
      expect(converter.map.invert['prok']).to eq 5
    end
  end
end
