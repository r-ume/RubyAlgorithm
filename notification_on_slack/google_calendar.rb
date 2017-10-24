require 'pry'
require 'date'
require './google_authentication.rb'

class GoogleCalendar
  PRIMARY_CALENDAR_ID = 'tcwaseda@gmail.com'
  APPLICATION_NAME    = 'Slack Notification From Calendar'
  CURRENT_DATETIME    = DateTime.now
  TOMORROW_DATETIME   = CURRENT_DATETIME + 1

  def initialize
    @google_calendar                                 = GoogleAuthentication.access_to_calendar_service
    @google_calendar.authorization                   = GoogleAuthentication.authorize
    @google_calendar.client_options.application_name = APPLICATION_NAME
  end

  def fetch_calendars
    @google_calendar.list_calendar_lists.items
  end

  def get_calendar_ids
    calendars = fetch_calendars.delete_if{ |calendar| calendar.id == PRIMARY_CALENDAR_ID }
    calendars.map{ |calendar| calendar.id }
  end

  def fetch_calendar_events
    calendar_events = get_calendar_ids.map do |calendar_id|
      @google_calendar.list_events(calendar_id).items.map do |event|
        {
            mentor: event.summary,
            start_time: event.start.date_time
        }
      end
    end
    calendar_events.flatten
  end

  def outputs_calendar_events
    fetch_calendar_events.items.map do |event|
      start = event.start.date || event.start.date_time
      "#{event.summary} (#{start})"
    end
  end

  def responses_empty?
    @google_calendar.response.item.empty?
  end
end
