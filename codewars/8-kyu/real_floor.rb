# What's the real floor?

=begin
Americans are odd people:
  in their buildings, the first floor is actually the ground floor and there is no 13th floor ('cause of superstition).

Write a function that given an American floor (passed as an integer) returns the real floor.
Moreover, your function should work for basement floors too:
  just return the same value as the passed one.
=end

class Integer
  # My Answer
  def real_floor
    return self if self.negative? || self.zero?
    return (self > 0 && self < 13) ? self - 1 : self - 2
  end

  # Best Answer
  def best_real_floor
    self >= 1 ? (self > 13 ? self-2 : self-1) : self
  end

end

p 15.best_real_floor
