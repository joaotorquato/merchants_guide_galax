require_relative 'merchant/roman_numeral_converter.rb'
require_relative 'merchant/merchant_converter.rb'

merchant_converter = MerchantConverter.new
puts merchant_converter.convert(ARGV.pop.to_s)
