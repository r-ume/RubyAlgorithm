Human = Struct.new(:age, :gender)

human = Human.new(10, 'male')
p human.age 
p human.gender
human.age = 20

p human[:age]
# => 20
human[:age] = 100

p Human.members

# Humanという構造体で、ageとgenderというプロパティを作る。
Struct.new('Human', 'age', 'gender')

Foo = Struct.new(:one, :two, :three)
foo = Foo.new('a', 'b', 'c')
foo.each { |value| puts value }
foo.members
foo.each_pair { |field, value| puts field, value }
p Hash[foo.each_pair.to_a]  

Bar = Struct.new(:a)
bar = Bar.new(b: [:c, :d])

p bar.dig(:a, :b, 1)

ThirdHuman = Struct.new('ThirdHuman', :age, :gender){
  def teen?
    (13..19).include?(age)
  end
}

ThirdHuman.new(10).teen?
ThirdHuman.new(14).teen?
# human = Human.new(10)
# p human.teen?
