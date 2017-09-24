people = %w(Alice Bob Charile)
block = Proc.new { |name| puts name }

people.each &block


# これが、どう動いているのか
(1..5).each(&method(:puts))

# 1. eachやmapは、ブロックを期待している。
# 2. method(:puts)をeach文の引数として渡すときに、method(:puts)がブロックであることが期待されることになる。
# 3. ＆を前置したからRubyは、それがProcオブジェクトであると期待した。
# 4. 今度は、Procオブジェクトが期待される。
# 5. しかし、実際に来たのは、Methodオブジェクトである。
# 6. 暗黙的にMethodオブジェクトのto_procメソッドが働く。
# 7. Method#to_procが走ることになる
# 8. 結局、最後は、(1..5).each{ |num| puts num }となる。

class Symbol
  def to_proc
    Proc.new {|x| x.send self}
  end
end
