require 'csv'
require 'spreadsheet'
require 'diffy'

# header = ["date", "name", "count"]
# begin
#   csv_data = CSV.generate(:headers => header, :write_headers => true) do |csv|
#     # array = [
#     #   [Date.today, "Hiroki Akiyama", 6],
#     #   [Date.today, "Hiroki Akiyama", 6]
#     # ]
#     # csv << array
#     csv << [Date.today, "Hiroki Akiyama", 6]
#     csv << [Date.today, "Hiroki Akiyama", 6]
#   end
# rescue => error
#   p error
# end 

# p csv_data

# File.open("hoge.csv", 'w') do |file|
#   file.write(csv_data)
# end


# book = Spreadsheet::Workbook.new
# sheet1 = book.create_worksheet
# sheet1.name = "test"

# # 0行0列目にhogeと書き込む
# sheet1[0,0] = "hoge"

# # 3行8列目にfugaと書き込む
# sheet1[3,8] = "fuga"


# book.write "./staging.csv"


file1_lines = CSV.read("replica.csv")
file2_lines = CSV.read("staging.csv")

for i in 0..file1_lines.size
  if (file1_lines[i] == file2_lines[i])
    puts "Same #{file1_lines[i]}"
  else
    puts "#{file1_lines[i]} != #{file2_lines[i]}"
  end
end
