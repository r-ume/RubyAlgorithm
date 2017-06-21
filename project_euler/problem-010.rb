# Find the sum of all the primes below two million.

def prime?(num)
  if num == 1
    return false
  elsif number < 4
    return true
  elsif number%2 == 0
    return false
  elsif number < 9
    return true
  elsif number % 3 == 0
    return false
  else 
    r = (Math.sqrt(number).floor
    f = 5
    while f <= r
      if number % f == 0
        return false
      elsif number % (f+2) == 0
        return false
      end
      f += 6
      end  
      return true
    end #while
end

sum = 0
(2..2000000).each do |n|
  if prime?(n)
    sum_of_primes += n
  end
end

puts "Answer: #{sum}"


