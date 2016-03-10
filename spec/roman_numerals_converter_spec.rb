require 'roman_numeral_converter'

RSpec.describe RomanNumeralConverter, '#convert' do
  let(:converter) {RomanNumeralConverter.new}

  it 'calculates the roman number for 1' do
    expect(converter.convert(1)).to eq 'I'
  end

  it 'calculates the roman number for 2' do
    expect(converter.convert(2)).to eq 'II'
  end

  it 'calculates the roman number for 3' do
    expect(converter.convert(3)).to eq 'III'
  end

end
