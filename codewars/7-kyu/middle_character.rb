require 'rubygems'
require 'pry'

# Get the Middle Character

=begin
You are going to be given a word.
Your job is to return the middle character of the word.
If the word's length is odd, return the middle character.
If the word's length is even, return the middle 2 characters.
=end

class String
  # My Answer
  def my_middle_character
    middle = self.length / 2
    middle.even? ? "#{self[middle - 1]}#{self[middle]}" : self[middle]
  end

  # Answers on Codewars
  def middle_character_first
    mid = (self.length - 1) / 2
    self.length.odd? ? self[mid] : self[mid..mid+1]
  end

  def middle_character_second
    self[(self.size-1)/2..self.size/2]
  end
end

p 'pppp'.middle_character_second
