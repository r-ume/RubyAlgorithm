
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

