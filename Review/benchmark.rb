require 'rubygems'
require 'pry'
require 'benchmark'

array = 1000.times.map{ rand }

num_iteration = 10000

Benchmark.bm 10 do |r|
  r.report "inject" do
    num_iteration.times do
      sum = array.inject(&:+)
    end
  end

  r.report "each" do
    num_iteration.times do
      sum = 0
      array.each{|x| sum += x}
    end
  end
end

def sum_is_odd1(numbers)
  numbers.inject(&:+).odd?
end

def sum_is_odd2(numbers)
  numbers.select(&:odd?).inject(&:+).odd?
end

n = 1000
array = [*1...10000]

Benchmark.bm do |r|
  r.report 'sum_is_odd1' do
    n.times{ sum_is_odd1(array) }
  end

  r.report 'sum_is_odd2' do
    n.times{ sum_is_odd2(array) }
  end
end
