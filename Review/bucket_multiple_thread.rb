require_relative './bucket_condition_variable'

bucket = BucketConditionVariable.new

t1 = Thread.fork {
  15.times do |t|
    sleep rand
    bucket.append "line: #{t} \n"
  end
}

t2 = Thread.fork {
  3.times do
    bucket.flush
  end
}

[t1, t2].map(&:join)
