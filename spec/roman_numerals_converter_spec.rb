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

  it 'calculates the roman number for 90' do
    expect(converter.convert(90)).to eq 'XC'
  end

  it 'calculates the roman number for 100' do
    expect(converter.convert(100)).to eq 'C'
  end

  it 'calculates the roman number for 200' do
    expect(converter.convert(200)).to eq 'CC'
  end

  it 'calculates the roman number for 390' do
    expect(converter.convert(390)).to eq 'CCCXC'
  end

  it 'calculates the roman number for 400' do
    expect(converter.convert(400)).to eq 'CD'
  end

  it 'calculates the roman number for 500' do
    expect(converter.convert(500)).to eq 'D'
  end

  it 'calculates the roman number for 1000' do
    expect(converter.convert(1000)).to eq 'M'
  end

  it 'calculates the roman number for 2000' do
    expect(converter.convert(2000)).to eq 'MM'
  end

  it 'calculates the roman number for 3900' do
    expect(converter.convert(3900)).to eq 'MMMCM'
  end

  # test the return condition lines
  it 'calculates the roman number for 51' do
    expect(converter.convert(51)).to eq 'LI'
  end

  it 'calculates the roman number for 15' do
    expect(converter.convert(15)).to eq 'XV'
  end

end
