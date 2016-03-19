class PhraseAnalyser
  attr_reader :words_to_roman_hash, :metals, :to_answer

  def initialize(text)
    @words_to_roman_hash = {}
    @metals = []
    @to_answer = []

    text.chomp.strip.split("\n").each do |phrase|
      part_phrase = phrase.split(' is ')
      first_part_phrase = part_phrase[0].strip
      second_part_phrase = part_phrase[1] || ''
      analyse(first_part_phrase, second_part_phrase)
    end
  end

  private

  def analyse(first_part_phrase, second_part_phrase)
    if RomanNumeralConverter.roman_number? second_part_phrase
      map_to_roman(first_part_phrase, second_part_phrase)
    elsif second_part_phrase.include? 'Credits'
      set_metal_hash(first_part_phrase, second_part_phrase)
    else
      set_answer_hash(first_part_phrase, second_part_phrase)
    end
  end

  def map_to_roman(first_part_phrase, second_part_phrase)
    @words_to_roman_hash[first_part_phrase.to_sym] = second_part_phrase
  end

  def set_metal_hash(first_part_phrase, second_part_phrase)
    array_words = first_part_phrase.split(' ')
    @metals.push(metal: array_words.pop,
                 quantity: array_words.join(' '),
                 total_price: second_part_phrase.to_i)
  end

  def set_answer_hash(_first_part_phrase, second_part_phrase)
    if !second_part_phrase.empty?
      @to_answer.push(second_part_phrase.sub!('?', '').chomp.strip)
    else
      @to_answer.push('')
    end
  end
end
