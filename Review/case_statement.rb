# 問題
# 名前Name, レベルLevel, ポイントPointの各属性を持った複数のCharacterオブジェクトcharlie, liz, benがある。
# キャラクタのレベルい応じて、ポイントを加算するbonus_pointメソッドを実装せよ。
# ただし、キャラクタレベルが、
# => low(1 ~ 3)のときは、10ポイント、
# => mid(4 ~ 7)のときは、5ポイント、 
# => high(8 ~ 10)のときは、3ポイント
# それ以外のときは、0ポイントをpointに加算するものである。

class Character < Struct.new(:name, :level, :point)

  def to_s
    "%s:\tlv:%d\tpt:%d" % values
  end
end

char = Character.new('Char', 5, 0)
liz = Character.new('Liz', 3, 0)
ben = Character.new('Ben', 8, 0)


characters = [char, liz, ben]

puts characters

# >> Charlie: lv:5  pt:0
# >> Liz: lv:3  pt:0
# >> Ben: lv:8  pt:0

def bonus_point(character)
  character.point +=
    case character.level
    when low?; 10
    when mid?; 5
    when high?; 3
    else 0
    end
end

# Proc オブジェクト
private 
def level_seed(range)
  -> (lv) { range.include? lv } 
end

def low?
  -> (lv) { (1..3).include? lv }
end

def mid?
  -> (lv) { (4..7).include? lv }
end

def high?
  -> (lv) { [8, 9].include? lv }
end

bonus_point_proc = -> (chr) { bonus_point(chr) }

characters.map(&bonus_point_proc)

puts characters
