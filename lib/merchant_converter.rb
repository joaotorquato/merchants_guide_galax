require 'roman_numeral_converter'

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
      part_phrase = phrase.split(' is ')
      unless part_phrase[1].nil?
        second_part_phrase = part_phrase[1].strip
        # atualiza o mapa como os novos valores
        if roman_number? second_part_phrase
          key = @roman_numeral_converter.map.invert[second_part_phrase]
          @roman_numeral_converter.map[key] = part_phrase[0].strip;
        # calcula o valor dos itens não conhecidos
        elsif second_part_phrase.include? 'Credits'
          part_phrase[0].split(" ").each do |word|
            if @roman_numeral_converter.map.invert[word].nil? 
              new_word = word
              romans = part_phrase[0].sub!(word,"").split(" ")
              t = @roman_numeral_converter.convert_roman(romans)
              @metals[new_word] = second_part_phrase.to_f / t
            end
          end
        elsif part_phrase[0].include? 'how many'
          total_value = 0
          words = second_part_phrase.sub!("?","").chomp.strip
          words.split(" ").each do |word|
            if @roman_numeral_converter.map.invert[word].nil? 
              romans = second_part_phrase.sub!(word,"").split(" ")
              t = @roman_numeral_converter.convert_roman(romans)
              total_value = (t * @metals[word]).to_i 
            end
          end
          @output += "#{words} is #{total_value} Credits\n"
        elsif part_phrase[0].include? 'how much'
          words = second_part_phrase.sub!("?","").chomp.strip
          @output += "#{words} is #{@roman_numeral_converter.convert_roman(words.split(" "))}\n"
        else
          @output += "I have no idea what you are talking about\n"
        end
      else
        @output += "I have no idea what you are talking about\n" if phrase.include?('much')
      end
    end
    @output.empty? ? "I have no idea what you are talking about\n" : @output
  end

  def roman_number?(letter)
    %w(M D C L X V I).include? letter
  end
end
