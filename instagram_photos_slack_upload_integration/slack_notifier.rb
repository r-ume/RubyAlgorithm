require 'rubygems'
require 'pry'
require 'slack-notifier'

class SlackNotifier

  def initialize
    @notifier = Slack::Notifier.new(ENV['TIMES_JIO_SLACK_WEBHOOK_URL'])
  end

  def sends_notification(notification)
    @notifier.ping(notification)
  end

  def sends_image(image_url)
    @notifier.post(text: image_url)
  end

end
