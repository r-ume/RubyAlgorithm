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

class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.map { |wheel| diameter(wheel) }
  end

  def diameter(wheel)
    wheel.rim + (wheel.tire * 2 )
  end

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.map { |cell| Wheel.new(cell[0], cell[1]) }
  end
end

data = [[622, 20], [622, 23], [559, 30], [559, 40]]
instance = RevealingReferences.new(data)
p instance.diameters

class Gear 
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog       = cog
    @wheel     = Wheel.new(rim, tire)
  end 

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
     
  Wheel = Struct.new(:rim, :tire) do 
    def diameter
      rim + (tire * 2)
    end
  end
end

gear = Gear.new(1, 1, 1, 1)
p gear.gear_inches
# p gear.diameter => undefined


