require 'active_support/core_ext/time'

#t = Time.now
#puts t

#puts t.in_time_zone('Asia/Tokyo')
puts Time.now.in_time_zone('Asia/Tokyo').strftime('%H:%M')

puts Date.today.prev_day.strftime('%Y:%m:%d')
