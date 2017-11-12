sum = 0
(1..19).each {|i| sum +=1 }
puts sum

p (1..10).inject { |sum, i| sum + i }

p (1..10).inject(:+)

numbers = [4, 3, 9, 8, 5, 6, 1, 7, 2]
substraction = ->(diff, n) { diff - n }
p numbers.inject(100, &substraction)

p [:great, :good, :bad, :good, :good, :bad, :awesome, :great].inject(Hash.new(0)) { |hash, key| hash[key] += 1; hash }

%w(Alice Bob Charile).each_with_index do |name, index|
  puts "#{index}: #{name}"
end
# => {:great=>2, :good=>3, :bad=>2, :awesome=>1}

(1..3).reverse_each do |value|
  puts value
end
# => 3, 2, 1

(1..5).each_slice 2 do |a, b|
  p [a, b]
end
# => [1, 2], [3, 4], [5, nil]

(1..4).each_cons 2 do |a, b|
  p [a, b]
end
# => [1, 2], [2, 3], [3, 4]

# (1..3).cycle do |num|
#   p num
# end
# => 1, 2, 3, 2, 1... forever

# 配列の要素が全て真であるかを調べる
p [true, true, true].all?  # => true
p [false, true, true].all? # => false

# 配列の要素がすべて偽ならば、trueを返す
p [false, false, false].none? # => true

# 1つでも真の要素があれば、trueを返す
p [true, true, false].any? # => true
p [false, false, false].any? # => false

# 1つだけ真であれば、trueを返す
p [true, false, false].one? # => true

integer_proc = ->(v) { v.is_a?(Integer) }

p [4, 4, 2, 3].all?(&integer_proc) # => false
p [4, 4, 'two'].all?(&integer_proc) # => false

# grep
p %w(Alice Bob Charile).grep(/a/i)
p ['a', 'b', 3, 4].grep(String)
object = Object.new
object.methods.grep(/\?/)

even_checker = -> (num) { num.even? }
# get the first value that matches the condition.
p [4, 9, 2, 3].detect(&even_checker)
p [4, 9, 2, 3].select(&even_checker)
p [4, 9, 2, 3].reject(&even_checker)

smaller_than_three = -> (num){ num < 3 }
[4, 4, 2, 3].take_while(&smaller_than_three)
[4, 4, 2, 3].drop_while(&smaller_than_three)

# with_index method
[1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144].select.with_index { |num, index| ( num % (index + 1)).zero?}
# => [1, 5, 144]
