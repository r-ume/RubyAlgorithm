require 'rubygems'
require './array_iterator.rb'

array1 = [10, 50, 100]
array2 = [20, 30, 100]

def merge(array1, array2)
  merged = []

  iterator1 = ArrayIterator.new(array1)
  iterator2 = ArrayIterator.new(array2)

  while(iterator1.has_next? and iterator2.has_next?)
    if iterator1.item < iterator2.item
      merged << iterator1.next_item
    else
      merged << iterator2.next_item
    end
  end

  while(iterator1.has_next?)
    merged << iterator1.next_item
  end

  while(iterator2.has_next?)
    merged << iterator2.next_item
  end

  merged
end

p merge(array1, array2)
