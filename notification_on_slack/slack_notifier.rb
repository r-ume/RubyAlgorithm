require 'pry'
require 'dotenv/load'
require 'slack-notifier'

class SlackNotifier

  def initialize
    @notifier = Slack::Notifier.new(ENV['SLACK_WEBHOOK_URL'])
  end

  def sends_notification(notification)
    @notifier.ping(notification)
  end
end
