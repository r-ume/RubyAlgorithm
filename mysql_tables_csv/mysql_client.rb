require 'rubygems'
require 'mysql2'
require 'dotenv'
require 'csv'
require 'spreadsheet'
require 'pry'

Dotenv.overload

class MysqlClient

  TABLE_KEYS = %w(Field Type Null Key Default Extra).map(&:freeze).freeze

  def initialize
    @client ||= Mysql2::Client.new(host: ENV['MYSQL_HOST'], username: ENV['MYSQL_USERNAME'], password: ENV['MYSQL_PASSWORD'], database: ENV['MYSQL_DATABASE'], port: ENV['MYSQL_PORT'])
  end

  def tables
    @client.query('show tables').map{ |table| table["Tables_in_#{ENV['MYSQL_DATABASE']}"]}
  end

  def columns_in_all_tables
    self.tables.map { |table| 
      {
        "#{table}": self.columns(table: table) 
      }
    }
  end

  def columns(table:)
    @client.query("describe #{table}").map { |column| column.values }
  end
end

class CustomCSV
  def initialize(name:)
    @name = name
    @book = Spreadsheet::Workbook.new
  end

  def generate_file_with_data(tables:)
    tables.each do |table|
      sheet = @book.create_worksheet
      sheet.name = table.keys.first.to_s
      sheet.row(0).concat(MysqlClient::TABLE_KEYS)
      table.values.each_with_index do |columns, index|
        columns.each_with_index do |column_row, column_index|
          column_row.each_with_index do |column, column_row_index|
            sheet[column_index + 1, column_row_index] = column
          end
        end
      end
    end

    @book.write @name
  end
end

data = MysqlClient.new.columns_in_all_tables

custom_csv = CustomCSV.new(name: './staging.csv').generate_file_with_data(tables: data)
