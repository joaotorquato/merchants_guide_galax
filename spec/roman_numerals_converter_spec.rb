require 'roman_numeral_converter'

RSpec.describe RomanNumeralConverter, '#convert' do
  let(:converter) { RomanNumeralConverter.new }

  context 'Decimal to Roman Numeral' do
    it 'calculates the roman number for 1' do
      expect(converter.convert_decimal(1)).to eq 'I'
    end

    it 'calculates the roman number for 2' do
      expect(converter.convert_decimal(2)).to eq 'II'
    end

    it 'calculates the roman number for 3' do
      expect(converter.convert_decimal(3)).to eq 'III'
    end

    it 'calculates the roman number for 4' do
      expect(converter.convert_decimal(4)).to eq 'IV'
    end

    it 'calculates the roman number for 5' do
      expect(converter.convert_decimal(5)).to eq 'V'
    end

    it 'calculates the roman number for 9' do
      expect(converter.convert_decimal(9)).to eq 'IX'
    end

    it 'calculates the roman number for 10' do
      expect(converter.convert_decimal(10)).to eq 'X'
    end

    it 'calculates the roman number for 20' do
      expect(converter.convert_decimal(20)).to eq 'XX'
    end

    it 'calculates the roman number for 30' do
      expect(converter.convert_decimal(30)).to eq 'XXX'
    end

    it 'calculates the roman number for 39' do
      expect(converter.convert_decimal(39)).to eq 'XXXIX'
    end

    it 'calculates the roman number for 40' do
      expect(converter.convert_decimal(40)).to eq 'XL'
    end

    it 'calculates the roman number for 50' do
      expect(converter.convert_decimal(50)).to eq 'L'
    end

    it 'calculates the roman number for 90' do
      expect(converter.convert_decimal(90)).to eq 'XC'
    end

    it 'calculates the roman number for 100' do
      expect(converter.convert_decimal(100)).to eq 'C'
    end

    it 'calculates the roman number for 200' do
      expect(converter.convert_decimal(200)).to eq 'CC'
    end

    it 'calculates the roman number for 390' do
      expect(converter.convert_decimal(390)).to eq 'CCCXC'
    end

    it 'calculates the roman number for 400' do
      expect(converter.convert_decimal(400)).to eq 'CD'
    end

    it 'calculates the roman number for 500' do
      expect(converter.convert_decimal(500)).to eq 'D'
    end

    it 'calculates the roman number for 1000' do
      expect(converter.convert_decimal(1000)).to eq 'M'
    end

    it 'calculates the roman number for 2000' do
      expect(converter.convert_decimal(2000)).to eq 'MM'
    end

    it 'calculates the roman number for 3900' do
      expect(converter.convert_decimal(3900)).to eq 'MMMCM'
    end

    # test the return condition lines
    it 'calculates the roman number for 51' do
      expect(converter.convert_decimal(51)).to eq 'LI'
    end

    it 'calculates the roman number for 15' do
      expect(converter.convert_decimal(15)).to eq 'XV'
    end
  end

  context 'Roman Numeral to Decimal' do
    it 'calculates the decimal for I' do
      expect(converter.convert_roman('I')).to eq 1
    end
    it 'calculates the decimal for IV' do
      expect(converter.convert_roman('IV')).to eq 4
    end
    it 'calculates the decimal for XXIV' do
      expect(converter.convert_roman('XXIV')).to eq 24
    end
    it 'calculates the decimal for MMMCM' do
      expect(converter.convert_roman('MMMCM')).to eq 3900
    end
    it 'calculates the decimal for XXXIX' do
      expect(converter.convert_roman('XXXIX')).to eq 39
    end
  end
end
