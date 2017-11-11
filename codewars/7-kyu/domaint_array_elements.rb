require 'rubygems'
require 'pry'

# Dominant Array Elements

# An element in an array is dominant if it is greater than all elements to its right.
# For example, in the array [1,21,4,7,5], we see that 21,7,5 are dominant. Therefore, solve([1,21,4,7,5]) = [21,7,5], which is the order in which they appear.
# More examples in the test cases.
# Good luck!

class Array
  # My Answer failed
  def domimant_element
    answers = []
    self.each_with_index do |value, key|
      answers << value if key == (self.size - 1)
      next if value >= self[key + 1]
      p "#{key}: #{value}"
    end
  end

  # Best of the best answer
  def best_domimant_element
    self.select.with_index { |n, i| self.slice(i..-1).none? { |el| el > n } }.uniq
  end

  def second_best_domimant_element
    xs.reverse_each.each_with_object([]) { |x, res|
      res << x if res.empty? || x > res.last
    }.reverse!
  end

  def third_best_domaimant_element
    res = []; t = arr[-1]; res.push(t)
    (arr.length - 2).downto(0) do |i| #for i in arr.length - 2..0
      if t < arr[i]
        t = arr[i]; res.push(t)
      end
    end
    return res.reverse!
  end
end

[1, 21, 4].best_domimant_element
