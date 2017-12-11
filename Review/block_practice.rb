require 'rubygems'
require 'pry'

def block_sample
  puts 'stand up'
  # yieldの実装を呼びだし先で定義する。
  yield if block_given?
  puts 'sit down'
end

block_sample do
  p 'walk'  
end

# File Object without Block
file = File.open('without_block.txt', 'w')
file.puts 'without block'
file.close

# File Object with Block
File.open 'with_block.txt', 'w' do |file|
  file.puts 'with block'
end

def blocked_arg
  yield()
end

blocked_arg do |a|
  p [a]
end

# => nil

def blocked_arg
  yield(1, 2, 3)
end

blocked_arg do |a|
  p a 
end

# => 1

def block_arg
  yield(1, 2, 3)
end

blocked_arg do | *a |
  p a
end

# => p[1, 2, 3]

def with_current_time
  yield(Time.now)
end

with_current_time do |now|
  puts now.year
end

# & 引数名にすると、与えられたブロックは、Procオブジェクト化される。
def total(from, to, &block)
  result = 0
  from.upto(to) do |num|
    if block
      result += block.call(num)
    else
      result += num
    end
  end
  result
end

p total(1, 10)
p total(1, 10){ |num| num ** 2 }

def my_method (&my_block)
  my_block
end

obj = my_method { |x| x + 1 }
obj.call(2)

def magic_five_box(after_input, someProc)
  someProc.call(after_input, 5)
end

sum_proc = Proc.new do |x, y|
  p x + y
end

magic_five_box(3, sum_proc)
