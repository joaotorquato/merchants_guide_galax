class MerchantConverter
  def initialize
    @roman_numeral_converter = RomanNumeralConverter.new
    @output = ''
    @metals = {}
  end

  def map_word(word, value)
    key = @roman_numeral_converter.map.invert[word]
    @roman_numeral_converter.map[key] = value
  end

  def map_metal(words, value)
    words.split(' ').each do |word|
      # if not in the roman hash, is a metal
      next unless @roman_numeral_converter.map.invert[word].nil?
      romans = words.sub!(word, '').split(' ')
      t = @roman_numeral_converter.convert_roman(romans)
      @metals[word] = value.to_f / t
    end
  end

  def calculate_value_with_metal(words)
    total_value = 0
    words.split(' ').each do |word|
      next unless @roman_numeral_converter.map.invert[word].nil?
      t = calculate_value(words.sub!(word, ''))
      total_value = (t * @metals[word]).to_i
    end
    total_value
  end

  def calculate_value(words)
    @roman_numeral_converter.convert_roman(words.split(' '))
  end

  def convert(file_path)
    @file = File.open(file_path)
    text = @file.read.chomp.strip.split("\n")
    text.each do |phrase|
      part_phrase = phrase.split(' is ')
      if !part_phrase[1].nil?
        second_part_phrase = part_phrase[1].strip
        # atualiza o mapa de algorismos como os novos valores
        if RomanNumeralConverter.roman_number? second_part_phrase
          map_word(second_part_phrase, part_phrase[0].strip)
        # calcula o valor dos itens não conhecidos
        elsif second_part_phrase.include? 'Credits'
          map_metal(part_phrase[0], second_part_phrase)
        elsif part_phrase[0].include? 'how many'
          words = second_part_phrase.sub!('?', '').chomp.strip
          @output += "#{second_part_phrase.strip} is #{calculate_value_with_metal(words)} Credits\n"
        elsif part_phrase[0].include? 'how much'
          words = second_part_phrase.sub!('?', '').chomp.strip
          @output += "#{words} is #{calculate_value(words)}\n"
        else
          @output += "I have no idea what you are talking about\n"
        end
      else
        @output += "I have no idea what you are talking about\n" if phrase.include?('much')
      end
    end
    @output.empty? ? "I have no idea what you are talking about\n" : @output
  end
end
