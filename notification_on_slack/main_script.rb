require 'rubygems'
require 'pry'
require './google_authentication.rb'
require './google_calendar.rb'
require './slack_notifier.rb'
require './mentors.rb'
require './util/array_iterator.rb'

google_calendar = GoogleCalendar.new
shifts = google_calendar.today_shifts

shifts_with_mentions = Mentors.add_their_mentions_into(shifts)

slack_notifier = SlackNotifier.new
slack_notifier.sends_todays_shifts(shifts_with_mentions)
