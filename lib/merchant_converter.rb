class MerchantConverter
  def initialize
    @roman_numeral_converter = RomanNumeralConverter.new
    @output = ''
    @metals = {}
  end

  def convert(file_path)
    @file = File.open(file_path)
    text = @file.read.chomp.split("\n")
    text.each do |phrase|
      part_phrase = phrase.split('is')
      unless part_phrase[1].nil?
        second_part_phrase = part_phrase[1].strip
        # atualiza o mapa como os novos valores
        if roman_number? second_part_phrase
          key = @roman_numeral_converter.map.invert[second_part_phrase]
          @roman_numeral_converter.map[key] = part_phrase[0].strip;
        # calcula o valor dos itens não conhecidos
        elsif second_part_phrase.include? 'Credits'
          part_phrase[0].split(" ").each do |word|
            if !roman_number?(word) do
              new_word = word
              t = @roman_numeral_converter.convert_roman(part_phrase[0].sub!(word,"").split(" "))
            end
          end
          @metals[new_word] = second_part_phrase.to_i / t
        elsif part_phrase[0].include? 'how much'
          words = second_part_phrase.sub!("?","").chomp.strip
          @output += "#{words} is #{@roman_numeral_converter.convert_roman(words.split(" "))}\n"
        else
          @output += "I have no idea what you are talking about\n"
        end
      end
    end
    unless @output.empty?
      @output
    else
      "I have no idea what you are talking about\n"
    end
  end

  def roman_number?(letter)
    %w(M D C L X V I).include? letter
  end
end
