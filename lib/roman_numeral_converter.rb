class RomanNumeralConverter
  def initialize
    @map = [1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD',
            100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL',
            10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I']
  end

  def convert(number)
    total = ''

    @map.first.each do |num, roman_number|
      while number >= num
        total += roman_number
        number -= num
      end
    end

    total
  end
end
