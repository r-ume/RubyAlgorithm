require 'rubygems'
require 'pry'
require './google_authentication.rb'
require './google_calendar.rb'
require './slack_notifier.rb'
require './mentors.rb'

google_calendar = GoogleCalendar.new
shifts = google_calendar.right_time_format_shifts

shifts_with_mentions = Mentors.add_their_mentions_into(shifts)

slack_notifier = SlackNotifier.new
slack_notifier.sends_notification(SlackNotifier::STARTER_NOTIFICATION)

shifts_with_mentions.each do |shift_with_mention|
  shifts_with_mention = "<#{shift_with_mention[:mention]}> : #{shift_with_mention[:calendar_name]} : #{shift_with_mention[:start_time]}"
  slack_notifier.sends_notification(shifts_with_mention)
end
