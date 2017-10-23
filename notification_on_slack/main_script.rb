require 'pry'
require './google_authentication.rb'
require './google_calendar.rb'
require './slack_notifier.rb'

google_calendar = GoogleCalendar.new
notifications = google_calendar.outputs_calendar_events

p notifications

slack_notifier = SlackNotifier.new
slack_notifier.sends_notification(notifications)
