require 'rubygems'
require 'pry'

class String
  # Best Answer
  def remove_first_last_character
    self[1..-2]
  end

  # My Answer
  # def remove_first_last_character
  #   self.slice!(0)
  #   self.slice!(self.size - 1)
  #   self
  # end
end

p 'ok'.remove_first_last_character
