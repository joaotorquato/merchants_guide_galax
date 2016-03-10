class RomanNumeralConverter
  def convert(number)
    total = String.new
    while number >= 1000
      total += 'M'
      number -= 1000
    end
    if number >= 900
      total += 'CM'
      number -= 900
    end
    if number >= 500
      total += 'D'
      number -= 500
    end
    if number >= 400
      total += 'CD'
      number -= 400
    end
    while number >= 100
      total += 'C'
      number -= 100
    end
    if number >= 90
      total += 'XC'
      number -= 90
    end
    if number >= 50
      total += 'L'
      number -= 50
    end
    if number >= 40
      total += 'XL'
      number -= 40
    end
    while number >= 10
      total += 'X'
      number -= 10
    end
    if number >= 9
      total += 'IX'
      number -= 9
    end
    if number >= 5
      total += 'V'
      number -= 5
    end
    if number >= 4
      total += 'IV'
      number -= 4
    end
    total += 'I' * number
  end
end

r = RomanNumeralConverter.new
puts r.convert(ARGV.pop.to_i)
