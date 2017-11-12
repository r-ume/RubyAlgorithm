require 'rubygems'
require 'pry'

# Remove First and Last Character

=begin
It's pretty straightforward.
Your goal is to create a function that removes the first and last characters of a string.
You're given one parameter, except in C, where, to keep the difficulty at the level of the kata, you are given two parameters, the first a buffer with length exactly the same as the second parameter, the original string
You don't have to worry with strings with less than two characters.
=end

class String
  # My Answer
  def remove_first_last_character
    self.slice!(0)
    self.slice!(self.size - 1)
    self
  end

  # Best Answer
  def best_remove_first_last_character
    self[1..-2]
  end
end

p 'ok'.best_remove_first_last_character
