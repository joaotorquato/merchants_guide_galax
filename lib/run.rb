require_relative 'merchant/roman_numeral_converter.rb'
require_relative 'merchant/merchant_converter.rb'
require_relative 'merchant/metal.rb'
require_relative 'merchant/phrase_analyser.rb'

merchant_converter = MerchantConverter.new
puts merchant_converter.convert(ARGV.pop.to_s)
