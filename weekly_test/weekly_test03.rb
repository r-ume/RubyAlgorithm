#1
# str = '100 200 300'
#
# arr = []
#
# for num in 0..str.chars.length do
#     arr[num] = str.chars[num]
#     if arr[num] == " "
#         arr.insert(num, ",")
#     end
# end
#
# p arr.join

#2

# str = '振込手数料は税込み432円です。'
#
# num = str.gsub(/[^\d]/, "").to_i


#3

# str = '今日の天気は雨です。'

#encoding: utf-8
# puts str.slice!(/雨/ || /晴れ/ || /曇り/)


#4
# sudo chmod go-w /usr/local/bin

#5

#rwxr-xr-x
#ファイル所有者には、読み取り/書きだし/実行の権限があり、
#グループには、 読み取り/実行の権限があり、
#その他には、同じく、読み取り/実行の権限がある。