str = %(Programming language Ruby)
puts str
# => Programming language "Ruby"

# %と%Qは同じ
ruby = 'Ruby'
str2 = %(Programming language "#{ruby}")
puts str2
# => Programming language "Ruby"

ruby = 'Ruby'
str2 = %Q(Programming language "#{ruby}")
puts str2
# => Programming language "Ruby"

ruby = "Ruby"
str = %q(Programming language "#{ruby}")
puts str
# => Programming language "#{ruby}"

array = %w(one two three four)
p array
# => ["one", "two", "three", "four"]

ruby = 'ruby'
PYTHON = 'PYTHON'
array = %W(#{ruby} #{PYTHON} PHP)
p array
# => ["ruby", "PYTHON", "PHP"]

array = %i(Ruby Python PHP)
p array
# => [:Ruby, :Python, :PHP]

ruby = 'Ruby'
JAVA = 'JAVA'
array = %I(#{ruby} #{JAVA} PHP)
p array

res = %x(date)
p res
# => "2017年 10月 7日 土曜日 20時35分38秒 JST\n"

sym = %s(Ruby PHP)
p sym
# => :"Ruby PHP"
