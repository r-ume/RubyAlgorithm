require 'rubygems'
require 'pry'
require 'slack-notifier'
require '/.notifier_interface.rb'

class SlackNotifier
  include NotifierInterface

  STARTER_NOTIFICATION = '先ほど投稿された写真がこちら！'

  def initialize
    @notifier = Slack::Notifier.new(ENV['TIMES_JIO_SLACK_WEBHOOK_URL'])
  end

  def sends_notification(notification)
    @notifier.ping(notification)
  end

  def sends_images(image_urls)
    image_urls.each do |image_url|
      sends_image(image_url)
    end
  end

  def sends_image(image_url)
    @notifier.post(text: image_url)
  end

end
