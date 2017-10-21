def bubble_sort(array)
  ary = array.dup
  pos_max = ary.length - 1

  (0...(pos_max)).each{|n|
    (0...(pos_max - n)).each{|ix|
      # 隣と比較して前が大きかったら後ろと交換
      iy = ix + 1
      ary[ix], ary[iy] = ary[iy], ary[ix] if ary[ix] > ary[iy] # 交換
    }
  }

  ary
end

require 'pp'

array = 10.times.map{ rand(100)} # [0..100) の整数 10個の配列を生成
pp array
pp (sorted_array = bubble_sort(array))
puts "is_sorted: #{array.sort == sorted_array}"