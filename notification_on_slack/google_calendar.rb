require 'rubygems'
require 'pry'
require 'date'
require './google_authentication.rb'
require './mentors.rb'

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

  def fetch_all_shifts
    all_shifts = get_calendar_ids.map do |calendar_id|
      @google_calendar.list_events(calendar_id).items.map do |event|
        {
            calendar_name: event.summary,
            start_time: event.start.date_time
        }
      end
    end
    all_shifts.flatten!
  end

  def shifts_without_no_start_time
    fetch_all_shifts.delete_if{ |shift| shift[:start_time].nil? }
  end

  def shifts_in_correct_time_format
    shifts_without_no_start_time.map do |shift|
      {
          calendar_name: shift[:calendar_name],
          start_time: shift[:start_time].strftime("%Y-%m-%d %H:%M")
      }
    end
  end

  def outputs_today_mentors_shift
    shifts_in_correct_time_format.select { |shift|
       shift[:start_time].between?(CURRENT_DATETIME, TOMORROW_DATETIME)
    }
  end

  def responses_empty?
    @google_calendar.response.item.empty?
  end
end
