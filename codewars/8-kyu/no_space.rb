# Remove Sting Spaces

# Simple, remove the spaces from the string, then return the resultant string.

class String
  # My Answer
  def no_space
    self.gsub(" ", "")
  end

  # Best Answer
  def best_no_space
    self.delete(' ')
  end
end

p "hello world kok".best_no_space
