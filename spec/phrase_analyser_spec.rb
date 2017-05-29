require 'spec_helper'

RSpec.describe PhraseAnalyser do
  describe '#roman_numeral_declaration?' do
    context 'when a word is declared as a roman number' do
      it 'returns true' do
        phrase_analyser = PhraseAnalyser.new('glob is I')
        expect(phrase_analyser.roman_numeral_declaration?).to eq true
      end
    end

    context 'when is anything else' do
      it 'returns false' do
        phrase_analyser = PhraseAnalyser.new('glob glob Silver is 34 Credits')
        expect(phrase_analyser.roman_numeral_declaration?).to eq false
      end
    end
  end

  describe '#price_statement?' do
    context 'when a there is a price statement' do
      it 'returns true' do
        phrase_analyser = PhraseAnalyser.new('glob glob Silver is 34 Credits')
        expect(phrase_analyser.price_statement?).to eq true
      end
    end

    context 'when is anything else' do
      it 'returns false' do
        phrase_analyser = PhraseAnalyser.new('glob is I')
        expect(phrase_analyser.price_statement?).to eq false
      end
    end
  end

  describe '#question?' do
    context 'when a there is question about the price' do
      it 'returns true' do
        phrase_analyser = PhraseAnalyser.new('how much is pish tegj glob glob?')
        expect(phrase_analyser.question?).to eq true
      end
    end

    context 'when is anything else' do
      it 'returns false' do
        phrase_analyser = PhraseAnalyser.new('glob is I')
        expect(phrase_analyser.question?).to eq false
      end
    end
  end
end
