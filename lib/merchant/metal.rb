class Metal
  def initialize(metals, roman_numeral_converter)
    @metals = {}
    @roman_numeral_converter = roman_numeral_converter
    metals.each do |metal|
      quantity = @roman_numeral_converter
                 .roman_to_decimal(metal[:quantity])
      @metals[metal[:metal]] = metal[:total_price].to_f / quantity
    end
  end

  def calculate(words)
    array_words = words.split(' ')
    metal = array_words.pop
    t = @roman_numeral_converter.roman_to_decimal(array_words.join(' '))
    (t * (@metals[metal] || 0)).to_i
  end
end
