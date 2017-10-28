
# 配列の最小値(最大値)を持つ要素を探して、それを配列の先頭要素と交換することで整列を行うアルゴリズムです
# 39612
# 19632
# 19632 と並べていく

# 選択ソート
def selection_sort(array)
  ary = array.dup
  (0...ary.length).each{|ix|
    # 最小値を検索
    min_num = ary[ix]
    min_pos = ix
    ((ix+1)...ary.length).each{|iy|
      if min_num > ary[iy]
        min_num = ary[iy]
        min_pos = iy
      end
    }

    # 最小値と ix を交換する
    ary[ix], ary[min_pos] = min_num, ary[ix]
  }
  ary
end

require 'pp'

array = 10.times.map{ rand(100) }
pp array
pp (sorted_array = selection_sort(array))
puts "is_sorted: #{array.sort == sorted_array}"