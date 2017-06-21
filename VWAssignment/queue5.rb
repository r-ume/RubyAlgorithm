class Queue
 
  def initialize
    @queue = []
  end
 
  def enqueue(object)
    @queue.push(object)
  end
 
  def dequeue
    @queue.reverse!
    @queue.pop
  end
end
 
my_queue = Queue.new
p my_queue.enqueue("hey")
p my_queue.enqueue("friend")
p my_queue.enqueue("hoge")
p my_queue.dequeue
p my_queue.dequeue
