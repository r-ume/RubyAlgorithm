=begin
We need a function that can transform a number into a string.
What ways of achieving this do you know?
=end
class Integer

  def convert_number_to_string
    self.to_s
  end

end

p 33.convert_number_to_string
