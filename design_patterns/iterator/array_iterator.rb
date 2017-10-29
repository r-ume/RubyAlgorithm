class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def has_next?
    @index < @array.length
  end

  def item
    @array[@index]
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

color_array = %w(red blue green)
i = ArrayIterator.new(color_array)

while i.has_next?
  p ("item: #{i.next_item}")
end
