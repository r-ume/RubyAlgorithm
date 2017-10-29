class GoodReport
  def initialize
    @title = '月次報告'
    @text = ['最高！', '順調', '普通']
  end

  def output_report
    output_start
    output_title
    output_body_start
    @text.each do |line|
      output_line(line)
    end
    output_body_end
    output_end
  end

  def output_start
  end

  def output_title
    output_line(@title)
  end

  def output_body_start
  end

  def output_line(line)
    raise 'Called abstract method: output_line'
  end

  def output_body_end
  end

  def output_end
  end
end
