require 'base64'

class MyBase64
  def self.base64_encode(str)
    keys = (0..63).map{|m| sprintf("%06s", m.to_s(2)).gsub(" ", "0")}
    values = [('A'..'Z'), ('a'..'z'), ('0'..'9'), ['+', '/']].map{|a| a.to_a}.flatten
    base64_table = Hash[[keys, values].transpose]

    binary = str.unpack("B*").pop.scan(/.{1,6}/).join(" ").split.map{ |s| sprintf("%-06s", s).gsub(" ", "0") }
    base64_list = binary.map{|a| base64_table[a]}.join.scan(/.{1,4}/)
    base64_list.map{|s| sprintf("%-4s", s).gsub(" ", "=")}.join
  end
end

p MyBase64.base64_encode("ABCDEFG")

p Base64.encode64("ABCDEFG")