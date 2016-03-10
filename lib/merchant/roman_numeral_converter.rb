class RomanNumeralConverter
  attr_accessor :map
  def initialize
    @map = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD',
             100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL',
             10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I' }
  end

  def convert_decimal(number)
    total = ''

    @map.each do |num, r_numeral|
      while number >= num
        total += r_numeral
        number -= num
      end
    end

    total
  end

  def convert_roman(roman_numeral)
    total = 0
    last_value = 0

    roman_numeral = roman_numeral.split('') unless roman_numeral.is_a?(Array)

    roman_numeral.each do |r_numeral|
      value = @map.invert[r_numeral]
      if value > 0
        total += if last_value < value
                   value - (2 * last_value)
                 else
                   value
                 end
      end
      last_value = value
    end

    total
  end
end
