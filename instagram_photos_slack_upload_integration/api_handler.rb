require 'rubygems'
require 'pry'
require 'faraday'
require 'dotenv'

Dotenv.overload

class ApiHandler

  USER_ID      = ENV['USER_ID']
  ACCESS_TOKEN = ENV['ACCESS_TOKEN']
  API_DOMAIN   = 'https://api.instagram.com/v1/users/'

  class << self
    def calls_image_api
      res = Faraday.get image_get_url
      p res.status    # => 200
      p res.success?  # => true
      res.headers.each do |k, v|
        puts "#{k}: #{v}"
      end
      puts res.body
    end

    def image_get_url
      "https://api.instagram.com/v1/users/#{USER_ID}/media/recent/?access_token=#{ACCESS_TOKEN}"
    end
  end


end

