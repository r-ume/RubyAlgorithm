people = %w(Alice Bob Charile)
block = Proc.new { |name| puts name }

people.each &block
