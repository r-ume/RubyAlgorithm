# Mentor
class Mentor

  # Deletes an access control rule.
  # @param [Hash] data The hash variable that has mentor info in it.
  # @return Mentor
  def initialize(data)
    @data = data
  end

  # Check if his/her birth day is a day before the given date.
  # @return boolean
  def day_before_birthday?
    @data['birthday'] == (Date.today - 1).strftime('%m/%d')
  end
end
