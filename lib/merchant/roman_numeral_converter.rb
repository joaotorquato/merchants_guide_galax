class RomanNumeralConverter
  attr_accessor :map

  def initialize
    @map = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD',
             100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL',
             10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I' }
  end

  def convert_roman(roman_numeral)
    total = 0
    last_value = 0
    roman_numeral.each do |r_numeral|
      value = @map.invert[r_numeral] || 0
      total += if last_value < value
                 value - (2 * last_value)
               else
                 value
               end
      last_value = value
    end
    total
  end

  def self.roman_number?(letter)
    %w(M D C L X V I).include? letter
  end

  def map_words_into_roman_hash(hash_words)
    hash_words.each do |word, value|
      key = @map.invert[value]
      @map[key] = word.to_s
    end
  end
end
