require 'rubygems'
require 'pry'
require 'faraday'
require 'dotenv'
require 'JSON'

Dotenv.overload

class ApiHandler

  USER_ID      = ENV['USER_ID']
  ACCESS_TOKEN = ENV['ACCESS_TOKEN']
  API_DOMAIN   = 'https://api.instagram.com/v1/users'

  class << self
    def gets_image_json_response
      res = Faraday.get image_api
      JSON.parse(res.body)
    end

    def image_api
      "#{API_DOMAIN}/#{USER_ID}/media/recent/?access_token=#{ACCESS_TOKEN}"
    end
  end

end

