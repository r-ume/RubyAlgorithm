# Simple, remove the spaces from the string, then return the resultant string.

class String
  def no_space
    self.gsub(" ", "")
  end
end

p "hello world".no_space
