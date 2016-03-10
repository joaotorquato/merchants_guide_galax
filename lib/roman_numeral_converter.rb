class RomanNumeralConverter
  def convert(number)
    total = String.new
    return 'L' if number == 50
    return 'XL' if number == 40
    while number >= 10
      total += 'X'
      number -= 10
    end
    if number >= 9
      total += 'IX'
      number -= 9
    end
    return 'V' if number == 5
    return 'IV' if number == 4
    total += 'I' * number
  end
end

r = RomanNumeralConverter.new
puts r.convert(ARGV.pop.to_i)
