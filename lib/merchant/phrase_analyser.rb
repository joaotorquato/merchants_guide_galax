class PhraseAnalyser
  attr_reader :first_part_phrase, :second_part_phrase

  def initialize(phrase)
    @words_to_roman_hash = {}
    @metals = []
    @to_answer = []

    part_phrase = phrase.split(' is ')
    @first_part_phrase = part_phrase[0].strip
    @second_part_phrase = part_phrase[1] || ''
  end

  def roman_numeral_declaration?
    RomanNumeralConverter.roman_number? @second_part_phrase
  end

  def price_statement?
    @second_part_phrase.include? 'Credits'
  end

  def question?
    @second_part_phrase.include? '?'
  end
end
