class RomanNumeralConverter
  def initialize(new_romans_numerals = {})
    @dictionary = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD',
                    100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL',
                    10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I' }

    update_dictionary(new_romans_numerals)
  end

  def roman_to_decimal(roman_numeral)
    total = 0
    last_value = 0
    split_numeral(roman_numeral).each do |r_numeral|
      value = @dictionary.invert[r_numeral] || 0
      total += check_roman_value(last_value, value)
      last_value = value
    end
    total
  end

  def self.roman_number?(letter)
    %w(M D C L X V I).include? letter
  end

  private

  def update_dictionary(new_romans_numerals)
    new_romans_numerals.each do |new_sign, value|
      key = @dictionary.invert[value]
      @dictionary[key] = new_sign.to_s
    end
  end

  def split_numeral(numeral)
    if numeral == numeral.upcase
      numeral.split('')
    else
      numeral.split(' ')
    end
  end

  def check_roman_value(last_value, value)
    if last_value < value
      value - (2 * last_value)
    else
      value
    end
  end
end
