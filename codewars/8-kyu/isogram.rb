require 'rubygems'
require 'pry'

class String
  # My Answer
  def isogram?
    return true if self.empty?

    for i in ('a'..'z')
      return false if self.has_same_letter?(i) || self.count(i) >= 2
    end

    true
  end

  def has_same_letter?(i)
    self.include?(i) && self.include?(i.upcase)
  end

  # Best Answer
  def best_isogram?
    self.downcase.chars.uniq == self.downcase.chars
  end

end

p 'aba'.best_isogram?
