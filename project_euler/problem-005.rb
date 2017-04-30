# What is the smallest positive number that is evenly divisiable
# by all of the numbers from 1 to 20

# The divisors are limited because there is no need to check disivion by all the numbers
# from 1 to 20.
# For example. if the number is divisible by 18, we know it's all divisible by 2, 3, 6, 9

# There is a chance to cut some run time by changing the order of the divisors.

def divisible_by_1to20?(number)
  divisors = [19, 18, 17, 16, 15, 14, 13, 12, 11]
  divisors.each do |divisor|
    if number % divisor != 0
       false
    end
  end

  true
end

number, base = 20, 1

until divisible_by_1to20?(number)
  number = base * 20
  base += 1
end

puts "Answer #{number}"