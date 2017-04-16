class Food
  @@foods = []

  def self.input
    puts "Put the name of main dish:"
    name = gets.chomp
    puts "Put its calory:"
    calory = gets.to_i

    food = Food.new(name, calory)
    @@foods << food
  end

  def self.show_all_calory
    all_calory = 0
    line = "--------------------------"
    puts line

    @@foods.each do |food|
      puts "#{food.name} :#{food.calory}kcal"
      all_calory = all_calory + food.calory
    end

    puts line
    puts "The total of calory: #{all_calory}kcal"
  end

  def initialize(name, calory)
    @name = name
    @calory = calory
  end

  def name
    return @name
  end

  def calory
    return @calory
  end

  while true do
    puts "[0]:Put calory"
    puts "[1]:Check the total of the calory"
    input = gets.to_i

    if input == 0
        Food.input
      elsif input == 1
        Food.show_all_calory
        exit
    end
  end
end
