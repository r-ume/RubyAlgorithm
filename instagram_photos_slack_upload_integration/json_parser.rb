require 'rubygems'
require 'pry'

class JsonParser
  attr_accessor :json

  def initialize(json)
    @json = json
  end

  def extracts_standard_resolution_images
    @json['data'].map { |element| element['images']['standard_resolution']['url'] }
  end

  def data_key_exists?
    @json['data'].empty? || @json['data'].nil?
  end
end


