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

