# 0から9の数字を含んでいればマッチする。
p /[0-9]/ === 'ruby'
p /[0-9]/ === 'ruby5'

def alice?(pattern)
  pattern === 'alice'
end

p alice?(/Alice/i)
p alice?('alice')

str = 'ruby5'

if matched = /[0-9]/.match(str)
  p matched
end

# sub(pattern, replacement)
# replace the first pattern
str = 'Hello, Mr.Tanaka'
p str.sub(/Mr./, 'Ms')

# gsub(pattern, replacement)
# replace all the matched patterns
str = 'yeah! yeah! hellyeah!'
p str.gsub(/yeah!/, 'Whoo!')

str = 'お腹がすいた、りんごが食べたい'
str = str.match(/お腹がすいた、(.+)が食べたい/)
p str[1]

p /Ruby/ =~ 'aaRuby'
p /Ruby/ =~ 'Java'

p '2015/07/27'.match(/\d{4}\/\d{2}\/\d{2}/)

pattern = /\d{3}-\d{4}-\d{4}/
p pattern === '080-1234-5678' 
p pattern === '03-1234-5678'

# \Aが文字列の先頭、\zは末尾を表す。
pattern = /\A\d{3}-\d{4}-\d{4}\z/
p pattern === '080-1234-5678'
p pattern === 'Phone: 080-1234-5678'
p pattern === '080-1234-5678 (mobile)'

str = 'abracatabra'

# without block
p str.scan(/.a/)

# with block
str.scan(/.a/) do |matched|
  p matched
end

str.scan(/(.)(a)/) do |matched|
 p matched
end







