require 'time'

day = ARGV[0].to_i
month = ARGV[1]
year = ARGV[2].to_i

calendar = { 'января' => 31, 'февраля' => 28, 'марта' => 31,
		     'апреля' => 30, 'мая' => 31, 'июня' => 30, 'июля' => 31,
		     'августа' => 31, 'сентября'=> 30, 'октября' => 31,
		     'ноября' => 30, 'декабря' => 31 }

if year > 1582
  calendar['февраля'] = 29 if year%400 == 0 || year%4 == 0 && year%100 > 0
end

if 1 <= day && day <= 31 && 1 <= year && year <= 2999 && 
	calendar.has_key?(month) && calendar[month] >= day

  days = nil

  calendar.each do |m,d|
  	if m == month
  	  days = d - day
  	elsif !days.nil?
  	  days += d
  	end
  end
  
  res = days
else
  res = 'Incorrect Data !'
end

puts res