class MerchantConverter
  def initialize
    @output = ''
    @words_to_roman = {}
    @metals = []
    @to_answer = []
  end

  def convert(file_path)
    @file = File.open(file_path)

    text_lines.each do |phrase|
      phrase_analyser = PhraseAnalyser.new(phrase)
      convert_phrase(phrase_analyser)
    end

    @roman_numeral_converter = RomanNumeralConverter.new(@words_to_roman)
    @metal = Metal.new(@metals, @roman_numeral_converter)
    answer
  end

  private

  def text_lines
    @file.read.chomp.strip.split("\n")
  end

  def convert_phrase(phrase_analyser)
    if phrase_analyser.roman_numeral_declaration?
      map_words_to_roman(phrase_analyser)
    elsif phrase_analyser.price_statement?
      map_metal_values(phrase_analyser)
    else
      add_answer(phrase_analyser)
    end
  end

  def map_words_to_roman(phrase_analyser)
    symbol = phrase_analyser.first_part_phrase.to_sym
    @words_to_roman[symbol] = phrase_analyser.second_part_phrase
  end

  def map_metal_values(phrase_analyser)
    array_words = phrase_analyser.first_part_phrase.split(' ')
    @metals.push(metal: array_words.pop,
                 quantity: array_words.join(' '),
                 total_price: phrase_analyser.second_part_phrase.to_i)
  end

  def add_answer(phrase_analyser)
    if phrase_analyser.question?
      word_to_answer = phrase_analyser.second_part_phrase
                                      .sub!('?', '').chomp.strip
      @to_answer.push(word_to_answer)
    else
      @to_answer.push('')
    end
  end

  def answer
    @to_answer.each do |words|
      @output += if (total = @metal.calculate(words)) > 0
                   "#{words} is #{total} Credits\n"
                 elsif (total = convert_to_roman(words)) > 0
                   "#{words} is #{total}\n"
                 else
                   "I have no idea what you are talking about\n"
                 end
    end
    @output
  end

  def convert_to_roman(words)
    @roman_numeral_converter.roman_to_decimal(words)
  end
end
