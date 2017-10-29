class PlainTextReport < GoodReport
  def output_title
    puts("*** #{@title} ***")
  end

  def output_line(line)
    puts(line)
  end
end
