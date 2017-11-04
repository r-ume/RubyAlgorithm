class Integer

  def get_real_floor
    return self if self.negative? || self.zero?
    return (self > 0 && self < 13) ? self - 1 : self - 2
  end
end

p 15.get_real_floor
