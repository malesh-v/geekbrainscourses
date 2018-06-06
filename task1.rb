i = ARGV[0]
a = ARGV[1].to_i
b = ARGV[2].to_i

case a
  when 2   
    i = "0b#{i}"
  when 8    
    i = "0#{i}"
  when 16    
    i = "0x#{i}"
  else
    unless a <= 10 && i.scan(/[^0-9]/)
      number = i.reverse
      number_decimal = 0
      i.length.times do 
        |i| number_decimal += number[i].to_i*a**i
      end
      i = number_decimal
    end
end

begin
  number_decimal = Integer"#{i}"
  0 <= number_decimal && number_decimal <= 10000 && 1 <= a && b <= 100
  puts number_decimal.to_s(b)
rescue ArgumentError
  puts 'Invalid arguments !'
end
