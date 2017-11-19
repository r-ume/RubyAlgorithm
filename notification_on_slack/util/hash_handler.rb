require 'date'

module Util
  class HashHandler
    TODAY = Date.today.strftime('%m/%d')

    class << self
      def has_today_birthday?(hash)
        hash[:birthday] == TODAY
      end
    end

  end
end
