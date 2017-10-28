require 'rubygems'
require 'pry'
require 'dotenv/load'
require 'slack-notifier'

class SlackNotifier

  STARTER_NOTIFICATION = '今日のシフトはこちら！'

  def initialize
    @notifier = Slack::Notifier.new(ENV['SLACK_WEBHOOK_URL'])
  end

  def sends_notification(notification)
    @notifier.ping(notification)
  end

end
