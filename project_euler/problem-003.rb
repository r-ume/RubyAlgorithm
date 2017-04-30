
# What is the larges prime factor of the number 60085147514

# see if the number is a prime number
def prime?(number)
  (2..number-1).each do |n|
    if number % n == 0
      return false
    end
  end
  true
end

# see if the assigned number can be divided by the number in each loop
def factor?(current_number, number)
  if number % current_number == 0
    true
  else
    false
  end
end

# returned number is a prime factor
def get_first_prime_factor(number)
  (2..number - 1).each do |current_number|
    if factor?(current_number, number) && prime?(current_number)
      return current_number
    end
  end
end

number = 600851475143
prime_factors = []
n = number

until prime?(n)
  prime_factor = get_first_prime_factor(n)
  prime_factors << prime_factor
  n = n / prime_factor
  # the loop stops when the assigned number can not divided by the prime factor because n returns false
end

prime_factors << n


# Many prime factors would be found, but we want the largest prime factor.
puts "Prime Factors: "
puts prime_factors
puts "Answer: #{(prime_factors.sort).at(prime_factors.length - 1)}"