require 'rubygems'
require 'pry'

=begin
This series of katas will introduce you to basics of doing geometry with computers.

Write the function circleArea/CircleArea which takes in a Circle object and calculates the area of that circle.
The Circle class can be seen below:
=end

# Represents a Circle where center is a Point and radius is a Number
class Circle
  attr_accessor :center, :radius
  def initialize(center, radius)
    @center = center
    @radius = radius
  end
end

# Represents a Point where x and y are Numbers
class Point
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
end

def circle_area(circle)
  circle.radius * circle.radius * Math::PI
end

p circle_area(Circle.new(Point.new(10, 10), 30))
