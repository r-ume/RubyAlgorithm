class User
  include CSV

  def to_csv
    "#{@name},#{@age}"
  end

  def from_csv
    parts = line.split(",")

    @name = parts[0]
    @age = parts[1]
  end

end

module CSV
  def to_csv
    raise "Not implemented"
  end

  def from_csv(line)
    raise "Not implemented"
  end
end
