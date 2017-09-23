p 'foobar'.empty? 
p ''.empty?

p 'foobar'.length

p 'Alice Bob Charile'.include?('Bob')

p 'Highlight'.start_with?('High')
p 'Highlight'.end_with?('light')

str = 'Pine'
str << 'apple'
p str

str2 = 'The Answer to life, the universe, and everything: 42'

str2[4]
str2[4, 6]
str2[4..9]

p 'dam'.reverse 

dam = 'dam'
p dam.reverse!

dam = 'dam2'
dam = dam.reverse
p dam

