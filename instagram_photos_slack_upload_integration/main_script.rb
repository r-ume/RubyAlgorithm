require 'rubygems'
require 'pry'
require './slack_notifier.rb'
require './api_handler.rb'
require './json_parser.rb'

json_response  = ApiHandler.gets_image_json_response
json_parser    = JsonParser.new(json_response)
image_urls     = json_parser.extracts_standard_resolution_images
slack_notifier = SlackNotifier.new
slack_notifier.sends_images(image_urls)
