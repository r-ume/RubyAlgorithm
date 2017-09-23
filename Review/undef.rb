def greet
  puts 'hola'
end

greet
puts 'hi'

undef greet, puts

greet
puts 'hi'
