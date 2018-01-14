require 'pry'

module Sweet
  def self.lot
    %w(brownie apple-pie bravarois pudding).sample
  end

  module Chocolate
  end

  module Brownie

  end
end

Sweet.lot

module Greetable
  def greet_to(name:)
    puts "Hello, #{name}. My class is #{self.class}."
  end
end

module Helloable
  def hello_to(name:)
    p "hello to #{name}"
  end
end

class Alice
  include Greetable
  extend Helloable

  def greet_to(name)
    super

    puts 'Nice to meet you.'
  end
end

alice = Alice.new
alice.greet_to(name: 'Bob')
Alice.hello_to(name: 'hoge')


class FriendList
  include Enumerable

  def initialize(*friends)
    @friends = friends
  end

  def each
    for v in @friends
      yield v
    end
  end
end

friend_list = FriendList.new('Alice', 'Bob', 'Charile')
p friend_list.count
p friend_list.map(&:upcase)
p friend_list.find{ |v| /b/  === v }

module Area
  def triangle(base, height)
    base * height / 2.0
  end

  def circle(radius)
    radius * radius * 3.14
  end

  module_function :triangle, :circle
end

puts Area.triangle(7, 5)
puts Area.circle(3)
