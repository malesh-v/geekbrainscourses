require 'time'

t1 = ARGV[0].to_i
t2 = ARGV[1].to_i

def names
  { hours:   {1 => 'час', 2 => 'часа', 3 => 'часов'},
    minutes: {1 => 'минута', 2 => 'минуты', 3 => 'минут'},
    seconds: {1 => 'секунда', 2 => 'секунды', 3 => 'секунд'}}
end

def sec_to_hms(time)         
  sec = time % 60
  time /= 60
  mins = time % 60
  time /= 60
  hrs = time
  check [hrs, mins, sec]
end

def convert(value,key)
  last_n = value.to_s[-1].to_i
  if last_n == 1 && (value < 10 || value > 20)
    t_name = names[key][1]
  elsif (last_n == 2 || last_n == 3 || last_n == 4)  && (value < 10 || value > 20)
    t_name = names[key][2]
  else
    t_name = names[key][3]
  end
  value.to_s + ' ' + t_name + ' '
end

def check(param)
  text = ''
  if param[0] > 0 # hours
    text += convert param[0], :hours
  end
  if param[1] > 0 # min
    text += convert param[1], :minutes
  end
  if param[2] > 0 # seconds
    text += convert param[2], :seconds
  end
  text.strip
end

if 1 <= t1 && t2 <= 100000
  summ = t1 + t2
  puts sec_to_hms summ
else
  puts 'Wrong arguments'
end