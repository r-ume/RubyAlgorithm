require 'pry'

class HashPractice
  def initialize(args)
    @chainring = args.fetch(:chainring, 40)

    # or

    args = defaults.merge(args)
    @chainring = args[:chainring]
  end

  def defaults
    { chainring: 40, cog: 18 }
  end
end

num_hash = { hoge: 1, fuga: 2, piyo: 3 }
p num_hash.select!{ |key, val| val.odd? } # => {:hoge=>1, :piyo=>3}

num_hash = { hoge: 1, fuga: 2, piyo: 3 }
p num_hash.reject!{ |key, val| val.odd? } # => {:fuga=>2}

hash = { hoge: 'foo', fuga: 'bar', piyo: 'baz' }
p hash.delete(:hoge) # => 'foo'
p hash # => {:fuga=>"bar", :piyo=>"baz"}

hash = { hoge: 'foo', fuga: 'bar', piyo: 'baz' }
p hash.keep_if { |key, val| true }

# from Ruby 2.4
names = { a: 'alice', b: 'bob', c: 'carol' }
p names.transform_values { |name| name.capitalize }

hash = { hoge: 'foo', fuga: 'bar', piyo: nil }
p hash.compact

a = { one: 'A', two: nil }
b = { two: 'B', three: 'C' }

p a.merge(b)
# => {:one=>"A", :two=>"B", :three=>"C"}

def keywords(**options)
  defaults = { alice: 'ありす', bob: 'ぼぶ' }
  hash     = defaults.merge(options)

  hash
end

p keywords(bob: 'ぼヴ')
# => {:alice=>"ありす", :bob=>"ぼヴ"}

num_hash = { hoge: 1, fuga: 2, piyo: 3 }
p num_hash.invert
# => {1=>:hoge, 2=>:fuga, 3=>:piyo}

num_hash = { hoge: 1, fuga: 1 }
p num_hash.invert 
# => {1=>:fuga}
# どちらも同じ要素だから、片方が消える

num_hash = { hoge: 1, fuga: 2, piyo: 3 }
p num_hash.keys

hash = { hoge: 'foo', fuga: 'bar', piyo: 'baz' }
two, three = hash.values_at(:fuga, :piyo)
p two   # => 'bar'
p three # => 'baz'

hash = {
  alice: { books: { wonder: 1865 } },
  charile: {}
}

p hash[:alice][:books][:wonder] # => 1865
p hash.dig(:alice, :books, :wonder) # => 1865

array = ['key1', 'one', 'key2', 'two']
p Hash[*array] # {"key1"=>"one", "key2"=>"two"}

