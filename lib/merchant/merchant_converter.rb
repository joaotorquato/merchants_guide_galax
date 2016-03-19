class MerchantConverter
  def initialize
    @output = ''
  end

  def convert(file_path)
    @file = File.open(file_path)
    @phrase_analyser = PhraseAnalyser.new(@file.read)
    @roman_numeral_converter = RomanNumeralConverter.new
    @roman_numeral_converter
      .map_words_into_roman_hash(@phrase_analyser.words_to_roman_hash)
    @metal = Metal.new(@phrase_analyser.metals, @roman_numeral_converter)
    answer
  end

  private

  def answer
    @phrase_analyser.to_answer.each do |words|
      @output += if (total = @metal.calculate(words)) > 0
                   "#{words} is #{total} Credits\n"
                 elsif (total = @roman_numeral_converter.convert_roman(words.split(' '))) > 0
                   "#{words} is #{total}\n"
                 else
                   "I have no idea what you are talking about\n"
                 end
    end
    @output
  end
end
