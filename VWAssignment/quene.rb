class Queue
  def initialize(length)
    @length = length
    @q = Array.new(@length)
    @head = 0
    @tail = 0
    @full = false
  end
  
  def enqueue(x)
    raise puts "overflow" if @head == @tail and @full
    @q[@tail] = x
    @tail = (@tail == @length - 1) ? 0 : @tail + 1
    @full = true if @head == @tail
    self
  end
  
  def dequeue
    raise puts "underflow" if @head == @tail and !@full
    x = @q[@head]
    @q[@head] = nil
    @head = (@head == @length - 1) ? 0 : @head + 1
    @full = false if @head == @tail
    x
  end
end

q = Queue.new(3)
p q.enqueue(1).enqueue(2)    #=>[1, 2, nil]
p q.dequeue                  #=>1
p q.enqueue(5).enqueue(6)    #=>[6, 2, 5]
p q.dequeue                  #=>2
