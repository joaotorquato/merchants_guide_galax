require_relative 'lib/merchants_guide_to_the_galaxy.rb'

merchant_converter = MerchantConverter.new
puts merchant_converter.convert(ARGV.pop.to_s)
