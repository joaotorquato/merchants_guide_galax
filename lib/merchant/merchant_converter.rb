class MerchantConverter
  def initialize
    @roman_numeral_converter = RomanNumeralConverter.new
    @output = ''
    @metals = {}
  end

  def convert(file_path)
    @file = File.open(file_path)
    text = @file.read.chomp.strip.split("\n")
    text.each do |phrase|
      analise_phrase(phrase)
    end
    @output
  end

  private

  def analise_phrase(phrase)
    part_phrase = phrase.split(' is ')
    first_part_phrase = part_phrase[0].strip
    second_part_phrase = part_phrase[1]
    if !first_part_phrase.include? 'how'
      define_vocabulary first_part_phrase, second_part_phrase
    else
      answer first_part_phrase, second_part_phrase
    end
  end

  def define_vocabulary(first_part_phrase, second_part_phrase)
    if RomanNumeralConverter.roman_number? second_part_phrase
      map_words(second_part_phrase, first_part_phrase)
    elsif second_part_phrase.include? 'Credits'
      map_words(first_part_phrase, second_part_phrase.to_i)
    end
  end

  def answer(first_part_phrase, second_part_phrase)
    if second_part_phrase.nil?
      @output += "I have no idea what you are talking about\n"
    else
      words = second_part_phrase.sub!('?', '').chomp.strip
      if first_part_phrase.include? 'many'
        @output += "#{words} is #{calculate_value(words)} Credits\n"
      elsif first_part_phrase.include? 'much'
        @output += "#{words} is #{calculate_value(words)}\n"
      end
    end
  end

  def map_words(words, value)
    array_words = words.split(' ')
    if @roman_numeral_converter.map.invert[array_words.last].nil?
      metal = array_words.pop
      t = @roman_numeral_converter.convert_roman(array_words)
      @metals[metal] = value.to_f / t
    else
      key = @roman_numeral_converter.map.invert[array_words.last]
      @roman_numeral_converter.map[key] = value
    end
  end

  def calculate_value(words)
    array_words = words.split(' ')
    if @roman_numeral_converter.map.invert[array_words.last].nil?
      metal = array_words.pop
      t = @roman_numeral_converter.convert_roman(array_words)
      total_value = (t * @metals[metal]).to_i
    else
      total_value = @roman_numeral_converter.convert_roman(array_words)
    end
    total_value
  end
end
