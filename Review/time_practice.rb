Time.now

Time.now.zone
Time.now.getutc

now = Time.now
now.utc
now.zone

now.to_i
now.to_f
now.to_r
now.to_s

p now.year
p now.month
p now.day
p now.hour
p now.min
p now.sec
p now.wday
p now.yday

# 夏時間か否か
p now.dst?

p now.sunday?
p now.monday?
p now.tuesday?
p now.wednesday?
p now.thursday?
p now.friday?
p now.saturday?

now = Time.now
p now.strftime('%Y')
p now.strftime('%p') # 'PM'
p now.strftime('%P') # 'pm'
p now.strftime('%#p') # 'pm'
p now.strftime('%#P') # 'PM'

p now.strftime('%B') # "September"
p now.strftime('%^B') # "SEPTEMBER"

