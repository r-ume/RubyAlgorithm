class Integer
  def deodorant_evaporator(content, evap_per_day, threshold)
    # Best Answer
    day, percent = 1, 100
    day += 1 while (percent -= percent*evap_per_day/100.0) > threshold
    day
  end
end
