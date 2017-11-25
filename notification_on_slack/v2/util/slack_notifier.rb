require 'slack-notifier'

# Slack Notifier
class SlackNotifier
  include Singleton

  def initialize
    Slack::Notifier.new(ENV['TIMES_JIO_SLACK_WEBHOOK_URL'], username: 'TECH::CAMP WASEDA SHIFT REMINDER')
  end

end
