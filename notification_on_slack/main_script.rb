require 'rubygems'
require 'pry'
require './google_authentication.rb'
require './google_calendar.rb'
require './slack_notifier.rb'
require './mentors.rb'

google_calendar = GoogleCalendar.new
notifications = google_calendar.outputs_today_mentors_shift

p notifications = notifications.join(', ')

slack_notifier = SlackNotifier.new
slack_notifier.sends_notification(notifications)
