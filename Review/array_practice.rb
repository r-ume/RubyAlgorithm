require 'pry'

arr = Array.new(2){Array.new(3)}

arr[0][1] = 1

p arr

array = Array.new(3, 'naive')
array[0].reverse!

p array
# => ["evian", "evian", "evian"]
# Caution: => ['evian', 'naive', 'naive'] ではない

array = [4, 4, 3, 2]
p array.empty? 

p [].empty? # => true
p [''].empty? # => false

p [1, 2, 3] + [4, 5]    # => [1, 2, 3, 4, 5]
p [4, 4, 2, 3] - [4, 3] # => [2]
p [1, 2, 3] & [2, 3, 4] # => [2, 3]

array = [4, 4, 2, 3]
p array.first    # => 4
p array.first(2) # => [4, 4]

p array.last    # => 3
p array.last(2) # => 2, 3

p array.sample    # => one chosen randomly
p array.sample(2) # => two chosen randomly

ary = [ [:foo, 4], [:bar, 2], [:baz, 3] ]
p ary.assoc(:bar)

array = [4, 4, 2, 3]
array[0] = 5
p array
# => [5, 4, 2, 3]
p array[10] = 1
# => [5, 4, 2, 3, nil, nil, nil, nil, nil, nil, 1]

array = [1, 2, 5]
array << 9 # => [1, 2, 5, 9]
array.push 10 # => [1, 2, 5, 10]
array.pop # => 3

array = [4, 3, 6, 7]
array.shift # => 4
p array # => [3, 6, 7]

array.unshift # => 7
p array # => [3, 6]

array = [1, 2, 3, 4]
integer_checker = Proc.new {|num| num.is_a?(Integer) }

p array.delete_if(&integer_checker) # => []
p array.reject!(&integer_checker)   # => nil

array = [1, 2, 3, 4]
p array.keep_if(&integer_checker) # [1, 2, 3, 4]
p array.select!(&integer_checker) # nil

array = [2, 6, 4, 1]
array.delete_at 1
p array # => [2, 4, 1]

array = [false, nil, 0, '', []]
p array = array.compact
# [false, 0, '', []] 

array = [false, nil, 0, '', []]
p array.compact!
# [false, 0, '', []] 

array = [4, 4, 4.0, 2]
p array = array.uniq
# => [4, 4.0, 2]

array = [4, 4, 4.0, 2]
p array.uniq!
# => [4, 4.0, 2]


array = [9, 34, 2, 1]
p array = array.reverse 
# => [1, 2, 34, 9]

array = [9, 34, 2, 1]
p array.reverse!
# => [1, 2, 34, 9]

array = [4, [5, [6, 7]]]
p array = array.flatten
# => 4, 5, 6, 7

array = [4, [5, [6, 7]]]
p array.flatten!
# => 4, 5, 6, 7

array = ['foooo', 'fooo', 'foo', 'fo']
length_order = Proc.new { |str| str.length }
p array.sort_by!(&length_order)


# 「self <=> other」
#  メソッドの場合はselfとotherを比較して、selfが大きい時に正、等しい時に0、小さい時に負の整数を返します。
#  そこで降順に並べるように記述してみます
numbers = [1, 2, 4, 6, 3, 9, 8, 7, 5]
p numbers.sort { |a, b| a <=> b } # [1, 2, 3, 4, 5, 6, 7, 8, 9]
# ここのアルゴリズム復習
p numbers.sort { |a, b| b <=> a } # [9, 8, 7, 6, 5, 4, 3, 2, 1]

nogizaka = [
  ["秋元真夏", 4165],
  ["生田絵梨花", 3400],
  ["生駒里奈", 3305],
  ["伊藤万理華", 2746],
  ["北野日奈子", 0],
  ["佐々木琴子", 310],
  ["白石麻衣", 2235],
  ["寺田蘭世", 1860],
  ["中田花奈", 3859],
  ["中元日芽香", 4580],
  ["西野七瀬", 2409],
  ["橋本奈々未", 3581],
  ["深川麻衣", 5823],
  ["星野みなみ", 339],
  ["堀未央奈", 3035],
]
puts nogizaka.sort_by { |_, b| b }.reverse

numbers = [1, 2, 3]
numbers_with_zero_and_100 = [0, *numbers, 100]
p numbers_with_zero_and_100 # => [0, 1, 2, 3, 100]
