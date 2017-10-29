require 'rubygems'
require 'pry'
require './subject.rb'

class Employee
  include Subject

  attr_reader :salary
  attr_accessor :title, :name

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    old_salary = @salary
    @salary = new_salary

    if old_salary != @salary
      notify_observers
    end
  end

end


