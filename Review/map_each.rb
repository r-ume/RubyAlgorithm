#Difference in each and map(collect) method
# - the basic principles are simple
# - they just get a single value within an array and do something with it
# - however, the difference is whether the return value is changed or not after the loop

#each
# - discards the return value of the block, and each simply returns the original object it was called on
# - eachメソッドの中で、処理を返さず、eachメソッドを使われた配列がそのまま返る
# - 値型で、１つ１つの要素を渡している
each_fruits = ['apple', 'banana', 'orange']
puts each_fruits
# => apple, banana, orange

each_fruits = each_fruits.each { |each_fruit| each_fruit.upcase  }
puts each_fruits
# => apple, banana, orange

#map
# - sets the current element being iterated over to the return value of the block, and then returns a new object with those changes
# - mapメソッドのないのでの処理は、使われた変数にも影響する
# - こちらは参照型で、引数を渡している。
map_fruits = ['peach', 'grape', 'strawberry']
puts map_fruits
# => peach, grape, strawberry

map_fruits = map_fruits.map { |map_fruit| map_fruit.upcase }
puts map_fruits
# => PEACH, GRAPE, STRAWBERRY