
# Add all the natural numbers below one thousand that are multiples of 3 or 5.

sum = 0
(1..9999).each do |number|
  if (number % 3 == 0) || (number % 5 == 0)
    sum += number
  end
end

p "Answer: " + sum.to_s