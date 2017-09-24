
# Shortening codes by using if statement after method in one line.
# before
if user.active?
  send_mail_to(user)
end

# after
send_mail_to(user) if user.active?


# Using unless statement rather than if + not
# before
user.destory if !user.active?

# after
user.destory unless user.active?

# Ternary Operaters
# before
if user.admin?
  'I appreciate for that.'
else
  'Thanks'
end

# after 
user.admin? ? 'I appreciate for that.' : 'Thanks'

# Checking conditions and putting returned value from a method in a variable at the same time 
# before
user = find_user
if user
  send_mail_to(user)
end

# after
if user = find_user
  send_mail_to(user)
end

# Before
numbers = [1, 2, 3]
if numbers
  numbers.each { |num| num.is_a?(Integer) }
end

# After 
Array(numbers).each{ |num| num.is_a?(Integer) }

# Before 
class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

# After
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  # No Need
  # def name
  #   @name
  # end
end

# before
def count_admin(users)
  count = 0
  users.each do |user|
    count += 1 if user.admin?
  end
  count
end

# after
def count_admin(users)
  users.count(&:admin?)
end

# before
def user_names(users)
  names = []
  users.each do |user|
    names << user.name
  end
  names
end

# after
def user_names(users)
  users.map(&:name)
end

numbers = [1, 2, 3]

# Before
def numbers_text(numbers)
  text = ''
  numbers.each_with_index do |number, i|
    text += ', ' if i > 0
    text += number.to_s
  end
  text
end

# After
def numbers_text(numbers)
  numbers.join(',')
end

# Before
def oldest_user(users)
  oldest = nil
  users.each  do |user|
    oldest = user if oldest.nil? || user.age > oldest.age
  end
  oldest
end

# After
def oldest_user(users)
  users.max_by(&:age)
end
