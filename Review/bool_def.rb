# ? is not necessary to declare boolean method.
# however, writing ? is recommended

def in_array?(number, arr)
  return arr.include?(number)
end

arr = [1, 4, 5, 7]
number = 8

result = in_array?(number, arr)
p result