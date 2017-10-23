require 'pry'
require './google_authentication.rb'

class GoogleCalendar
  MAX_RESULT       = 10
  CALENDAR_ID      = 'primary'
  APPLICATION_NAME = 'Slack Notification From Calendar'

  def initialize
    @google_calendar                                 = GoogleAuthentication.access_to_calendar_service
    @google_calendar.authorization                   = GoogleAuthentication.authorize
    @google_calendar.client_options.application_name = APPLICATION_NAME
  end

  def fetch_calendar_events
    @google_calendar.list_events(
        CALENDAR_ID,
        max_results: MAX_RESULT,
        single_events: true,
        order_by: 'startTime',
        time_min: Time.now.iso8601
    )
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
