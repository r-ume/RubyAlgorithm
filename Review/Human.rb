class Human

  def initialize(name)
    @name = name
  end

  def introduce
    puts "my name is #{@name}."
  end
end

human1 = Human.new("ryo")
human1.introduce