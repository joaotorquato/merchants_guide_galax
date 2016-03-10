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

  it 'calculates the roman number for 4' do
    expect(converter.convert(4)).to eq 'IV'
  end

  it 'calculates the roman number for 5' do
    expect(converter.convert(5)).to eq 'V'
  end

  it 'calculates the roman number for 9' do
    expect(converter.convert(9)).to eq 'IX'
  end

  it 'calculates the roman number for 10' do
    expect(converter.convert(10)).to eq 'X'
  end

  it 'calculates the roman number for 20' do
    expect(converter.convert(20)).to eq 'XX'
  end

  it 'calculates the roman number for 30' do
    expect(converter.convert(30)).to eq 'XXX'
  end

  it 'calculates the roman number for 39' do
    expect(converter.convert(39)).to eq 'XXXIX'
  end

  it 'calculates the roman number for 40' do
    expect(converter.convert(40)).to eq 'XL'
  end

  it 'calculates the roman number for 50' do
    expect(converter.convert(50)).to eq 'L'
  end

end
