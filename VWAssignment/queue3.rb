class SimpleQueue
  def initialize(max)
    @max = max
    @queue = Array.new(max)
  end
  
  def clear
    @queue = []
  end
  
  def empty?
    @queue.empty?
  end
  
  def length
    @queue.length
  end
  alias :size :length
  
  def max
    @max
  end
  
  def max=(n)
    @max = n
  end
  
  def pop
    @queue.shift
  end
  alias :shift :pop
  alias :deq :pop

  def push(*items)
    items.each do |item|
      @queue << item
      if @queue.length > @max
        @queue.shift
      end
    end
    self
  end
  alias :<< :push
  alias :enq :push

  def queue
    @queue
  end 
end


queue = SimpleQueue.new(3)
queue.enq(1)
puts queue.pop
