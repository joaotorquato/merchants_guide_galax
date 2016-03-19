require 'spec_helper'

RSpec.describe PhraseAnalyser, '#words_to_roman_hash' do
  it 'should return the words that must be map into the roman hash' do
    phrase_analyser = PhraseAnalyser.new("glob is I\n")
    expect(phrase_analyser.words_to_roman_hash).to eq glob: 'I'
  end

  it 'should return the all words that must be map into the roman hash' do
    phrase_analyser = PhraseAnalyser.new("glob is I\nprok is V\n")
    expect(phrase_analyser.words_to_roman_hash).to eq glob: 'I', prok: 'V'
  end
end

RSpec.describe PhraseAnalyser, '#metals' do
  it 'should return the quantity, metal and total price of the metal' do
    phrase_analyser = PhraseAnalyser.new("glob glob Silver is 34 Credits\n")
    expect(phrase_analyser.metals)
      .to eq [quantity: 'glob glob', metal: 'Silver', total_price: 34]
  end

  it 'should return the quantity, metal and total price of the metal' do
    phrase_analyser =
      PhraseAnalyser
      .new("glob glob Silver is 34 Credits\nglob prok Gold is 57800 Credits\n")
    expect(phrase_analyser.metals)
      .to eq [{ quantity: 'glob glob', metal: 'Silver', total_price: 34 },
              { quantity: 'glob prok', metal: 'Gold', total_price: 57_800 }]
  end
end

RSpec.describe PhraseAnalyser, '#to_answer' do
  it 'should return the words for the answer for "how much"' do
    phrase_analyser =
      PhraseAnalyser.new("how much is pish tegj glob glob ?\n")
    expect(phrase_analyser.to_answer.first)
      .to eq 'pish tegj glob glob'
  end

  it 'should return the words for the answer for "how many"' do
    phrase_analyser =
      PhraseAnalyser.new("how many Credits is glob prok Gold ?\n")
    expect(phrase_analyser.to_answer.first)
      .to eq 'glob prok Gold'
  end

  it 'should return the words for the answer for "how many"' do
    phrase_analyser =
      PhraseAnalyser
      .new("how many Credits is glob prok Gold ?\n" \
           "how much is pish tegj glob glob ?\n")
    expect(phrase_analyser.to_answer)
      .to eq ['glob prok Gold', 'pish tegj glob glob']
  end
end
