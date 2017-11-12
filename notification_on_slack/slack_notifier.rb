require 'rubygems'
require 'pry'
require 'dotenv/load'
require 'slack-notifier'

class SlackNotifier

  STARTER_NOTIFICATION      = '明日のシフトはこちら！'
  HOPING_REACTION_STATEMENT = '`こちらにメンションがついている方は今日23時までに必ず本通知にリアクション` をお願いします!'
  NO_SHIFT_STATEMENT        = '明日のシフトはありません！'

  def initialize
    @notifier = Slack::Notifier.new(ENV['SLACK_WEBHOOK_URL'], username: 'TECH::CAMP WASEDA SHIFT REMINDER')
  end

  def sends_notification(notification)
    @notifier.post(text: notification)
  end

  def sends_tomorrow_shifts(shifts_with_mentions)
    self.sends_notification(STARTER_NOTIFICATION)

    shifts_with_mentions.each do |shift_with_mention|
      notification = "<#{shift_with_mention[:mention]}> : #{shift_with_mention[:calendar_name]} : #{shift_with_mention[:start_time]}"
      self.sends_notification(notification)
    end

    self.sends_notification(HOPING_REACTION_STATEMENT)
  end

end
