require 'rubygems'
require 'pry'

class Integer
  def divisible_by?(divisor)
    self % divisor == 0
  end
end

