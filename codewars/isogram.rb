require 'rubygems'
require 'pry'

class String
  # Best Answer
  def isogram?
    self.downcase.chars.uniq == self.downcase.chars
  end

  # My Answer
  # def isogram?
  #   return true if self.empty?
  #
  #   for i in ('a'..'z')
  #     return false if self.has_same_letter?(i) || self.count(i) >= 2
  #   end
  #
  #   true
  # end
  #
  # def has_same_letter?(i)
  #   self.include?(i) && self.include?(i.upcase)
  # end
end

p 'aba'.isogram?
