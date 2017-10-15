class FirstBook
  # attr_accessor :title, :price

  def initialize(title, price)
    @title = title
    @price = price
  end

  def title
    @title
  end

  def price
    @price
  end

  def price=(price)
    @price = price
  end
end

class SecondBook
  attr_accessor :title, :price

  def initialize(title, price)
    @title = title
    @price = price
  end
end

book = FirstBook.new("Programming Ruby", 1980)
puts book.title
book.price = 2000
puts book.price

book = SecondBook.new("Programming Ruby", 1980)
puts book.title
book.price = 2000
puts book.price
