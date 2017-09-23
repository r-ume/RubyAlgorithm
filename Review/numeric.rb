p %w(Alice Bob Charile).sort { |a, b|
  a.length <=> b.length
} 

3.step 5 do |num|
  puts num
end

1.2.step 2.0, 0.2 do |num|
  p num
end

p 1.odd?
p 2.even?

3.downto 1 do |num|
  p num
end
