require 'rubygems'
require 'pry'
require './good_report.rb'
require './html_report.rb'
require './plain_text_report.rb'

report = HTMLReport.new
p report.output_report

report = PlainTextReport.new
p report.output_report
