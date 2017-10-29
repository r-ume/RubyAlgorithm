class FirstClass

end

p Class.ancestors

SecondClass = Class.new(FirstClass)
p SecondClass.superclass

# klass は classって変数に書きたいときに、代わりで書くもの
klass_object = nil

ThirdClass = Class.new do |klass|
  klass_object = klass
  klass == self

  def hello
    :hello
  end
end

p klass_object == ThirdClass
