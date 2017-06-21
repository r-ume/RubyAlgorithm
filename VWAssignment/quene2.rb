class UserQueue
	def initialize
		@q1 = []
		@q2 = []
	end
	
	def enqueue(x)
		@q1.push(x)
		p @q1
	end
	
	def dequeue
		if @q2.empty?
			s = @q1.size
			s.times {@q2.push(@q1.pop)}
		end
		@q2.pop
	end
end

q = UserQueue.new
p q.enqueue(1)
p q.enqueue(2)
q.dequeue
p q


