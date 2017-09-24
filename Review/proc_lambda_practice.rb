require 'pry'

# Proc

greeter = Proc.new { |name| puts "Hello, #{name}" }
by_proc = proc { |name| puts "Hello, #{name}" }
by_lambda = lambda { |name| puts "Hello, #{name}" }
by_literal = ->(name) { puts "Hello, #{name}" } 

greeter.call    'Ruby'    # output: Hello, Ruby
by_proc.call    'Proc'    # output: Hello, Proc
by_lambda.call  'lambda'  # output: Hello, lambda
by_literal.call 'literal' # output: Hello, literal

upcasable = -> (str) { str.upcase }
p %w(hoge fuga piyo).map(&upcasable)

class Foo
  def to_proc
    ->(str) { str.upcase }
  end
end

p %w(hoge_a fuga_a piyo_a).map(&Foo.new)

# Difference between Proc and Lambda

hoge_lambda = lambda { |num1, num2| p [num1, num2] }
hoge_lambda.call(1, 2)
# hoge_lambda.call(1) => wrong number of arguments (given 1, expected 2) (ArgumentError)
# hoge_lambda.call(1, 2, 3) => wrong number of arguments (given 3, expected 2) (ArgumentError)

hoge_literal = -> (num1, num2) { p [num1, num2] }
hoge_literal.call(1, 2)
# hoge_literal.call(1) => wrong number of arguments (given 1, expected 2) (ArgumentError)
# hoge_literal.call(1, 2, 3) => wrong number of arguments (given 3, expected 2) (ArgumentError)

hoge_proc = Proc.new { |num1, num2| p [num1, num2] }
hoge_proc.call(1, 2)
hoge_proc.call(1) # => [1, nil]
hoge_proc.call(1, 2, 3) # => [1, 2]

def lambda_method
  fuga_lambda = lambda { return :foo }
  fuga_lambda.call
  return nil
end

p lambda_method
# => nil

def proc_method
  pobj = proc { return :bar }
  pobj.call
  return nil
end

p proc_method
# => :bar

