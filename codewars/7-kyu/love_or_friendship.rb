require 'rubygems'
require 'pry'

# Love Or FriendShip

=begin
If　a = 1, b = 2, c = 3 ... z = 26
Then l + o + v + e = 54
and f + r + i + e + n + d + s + h + i + p = 108
So friendship is twice stronger than love :-)
The input will always be in lowercase and never be empty.
=end

class String
  # Best Answers
  def words_to_marks
    binding.pry
    self.sum - self.size * 96
  end

  # def words_to_marks(string)
  #   string.sum - string.size * 96
  # end

  # def words_to_marks(string)
  #   string.codepoints.map {|n| n - 96}.inject(:+)
  # end

  # LETTERS = ('a'..'z').to_a
  # def words_to_marks(string)
  #   string.chars.inject(0){ |sum, l| sum + LETTERS.index(l) + 1 }
  # end

  # def words_to_marks(string)
  #   string.split("").map{ |character| character.ord - 96 }.reduce(:+)
  # end

  # def words_to_marks(string)
  #   words = ("a".."z").to_a
  #   string.chars.map{|x| words.index(x)+1}.inject(:+)
  # end
end

p 'f'.words_to_marks
