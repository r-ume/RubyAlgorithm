require 'rubygems'
require 'pry'
require 'csv'

header = %w(date name count)
CSV.open('csv_by_ruby.csv', 'w', write_headers: true, headers: header) do |csv|
  csv << [Date.today, 'r-ume', 6]
end
