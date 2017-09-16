require 'pry'

class Item
  @@items = []

  def initialize
    input = {}

    p 'Input an title for the item.'
    input[:title] = gets.chomp
    p 'Input a comment to the item.'
    input[:comment] = gets.chomp

    p "Title: #{input[:title]} \n"
    p "Commment: #{input[:comment] } \n"

    @@items << input
  end

  def self.list_all_items
    @@items.each_with_index{ |item, index| p "#{index + 1}: #{item[:title]} : #{item[:comment]}" }
  end

  def self.items_size
    @@items.size || 0
  end

  def self.specific_item(index)
    specific_item = @@items[index - 1]
    p "Title: #{specific_item[:title]}, Comment: #{specific_item[:comment]}"
  end

  def self.end_program
    exit
  end

end

while true do
  p "The number of comments: #{Item.items_size}"
  p "1. Make a new comment."
  p "2. Get a detail of s specific item."
  p "3. List all comments."
  p "4. End Program."

  choice = gets.to_i

  if choice == 1
    item = Item.new
  elsif choice == 2
    Item.list_all_items
    p "Choose a specific item that you would like to take a look at."
    index = gets.to_i
    Item.specific_item(index)
  elsif choice == 3
    Item.list_all_items
  elsif choice == 4
    Item.end_program
  else
    p "Must choose a number between 1 and 3."
  end
end
