# review of begin, rescue, ensure, and raise statement
# error handling
# http://qiita.com/ktarow/items/9d8f3217bb148f2e51d2

# workflow
# begin -> rescue -> ensure

class ExceptionTest
  def test
    begin
      # have an error happen
      1/0

    # parent class of ZeroDivisionError
    rescue StandardError => ex
      puts "StandardError"
      raise # raise statement is like throw statement in php or javascript
    rescue ZeroDivisionError => ex
      puts "ZeroDivisionError"
    ensure
      puts "Ensure"
    end
  end
end

obj = ExceptionTest.new
# error happening

begin
  obj.test
rescue => ex
  puts "Other"
  puts "Class: #{ex.class}"
end

# = begin
# ZeroDivisionError
# Ensure
# Other
# class: ZeroDivisionError
# = end
