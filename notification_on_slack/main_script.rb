require 'rubygems'
require 'pry'
require './google_authentication.rb'
require './google_calendar.rb'
require './slack_notifier.rb'
require './mentors.rb'

google_calendar = GoogleCalendar.new
shifts = google_calendar.right_time_format_shifts

shifts_with_mentions = []

Mentors.values.each { |value|
  shifts.each { |shift|
    if shift[:calendar_name].include?(value[:calendar_name])
      shift_with_mention = value.merge(shift)
      shifts_with_mentions << shift_with_mention
    end
  }
}

shifts_with_mentions.map do |shift_with_mention|
  slack_notifier      = SlackNotifier.new
  shifts_with_mention = "<#{shift_with_mention[:mention]}> : #{shift_with_mention[:calendar_name]} : #{shift_with_mention[:start_time]}"
  slack_notifier.sends_notification(shifts_with_mention)
end
