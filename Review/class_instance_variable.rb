# Class Instance Variable

# Characteristic
# - class methods can access class instance variables
# - instance methods cannot access class instanve variables

class Foo
  @class_variable_var = 'class_variable_var'

  # class methods CAN access @class_instance_variable_var
  def self.xxx
    p @class_variable_var
  end

  # instance methods CANNOT access @class_instance_variable_var
  def yyy
    p @class_variable_var
  end
end

class Bar < Foo

end

Foo.xxx

foo = Foo.new
foo.yyy

# Even if a class inherits another that has a class instance variable, it cannot use any class instance variable.
Bar.xxx
