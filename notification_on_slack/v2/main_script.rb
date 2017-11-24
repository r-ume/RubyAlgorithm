require 'rubygems'
require 'yaml'
require 'pry'
require 'dotenv'
require '../v2/mentor_registry'
require '../v2/calendar'
require '../v2/calendar_item'

Calendar.shifts_tomorrow.each do |calendar_item|
  mentor = calendar_item.mentor

  if mentor.day_before_birthday?
    Slack.send_birthday_notification(calendar_item.mentor)
  end
end
