class BucketConditionVariable

  def initialize(limit = 5)
    # 出力されるまでに待つためのもの
    @appendable = ConditionVariable.new
    # 行数が一定数に達するまで待つためのもの
    @flushable  = ConditionVariable.new
    # @outのロック
    @lock       = Mutex.new
    # @outの行数が、@limitに達したら、@flushableになる。
    @limit      = limit
    # 出力される文字列
    @out         = ''
  end

  def append(str)
    @lock.synchronize {
      @appendable.wait(@lock) unless appendable?

      @out << str

      @flushable.signal if flushable?
    }
  end

  def flush
    @lock.synchronize {
      @flushable.wait(@lock) unless flushable?

      puts ' ---------- '
      puts @out

      @out = ''
      @appendable.signal if appendable?
    }
  end

  private
  def appendable?
    @out.lines.count < @limit
  end

  def flushable?
    !appendable?
  end
end
