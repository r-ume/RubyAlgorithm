class Parent
  def hoge
    p 'hoge'
  end
end

class Child < Parent
  def hoge
    super
  end
end

Child.new.hoge
