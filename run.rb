require_relative 'lib/merchant/roman_numeral_converter.rb'
require_relative 'lib/merchant/merchant_converter.rb'
require_relative 'lib/merchant/metal.rb'
require_relative 'lib/merchant/phrase_analyser.rb'

merchant_converter = MerchantConverter.new
puts merchant_converter.convert(ARGV.pop.to_s)
