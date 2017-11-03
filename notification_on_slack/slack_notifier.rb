require 'rubygems'
require 'pry'
require 'dotenv/load'
require 'slack-notifier'

class SlackNotifier

  STARTER_NOTIFICATION      = '今日のシフトはこちら！'
  HOPING_REACTION_STATEMENT = 'メンションの人はリアクションお願いします！'
  NO_SHIFT_STATEMENT        = '明日のシフトはありません！'

  def initialize
    @notifier = Slack::Notifier.new(ENV['SLACK_WEBHOOK_URL'])
  end

  def sends_notification(notification)
    @notifier.ping(notification)
  end

  def sends_tomorrow_shifts(shifts_with_mentions)
    self.sends_notification(STARTER_NOTIFICATION)

    shifts_with_mentions.each do |shift_with_mention|
      shifts_with_mention = "<#{shift_with_mention[:mention]}> : #{shift_with_mention[:calendar_name]} : #{shift_with_mention[:start_time]}"
      self.sends_notification(shifts_with_mention)
    end
  end

end
