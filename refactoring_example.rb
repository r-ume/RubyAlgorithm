# This file shows how code (in Ruby) should be refactored

# Not good code
class OrdersReport
  def initialize(orders, start_date, end_date)
    @orders = orders
    @start_date = start_date
    @end_date = end_date
  end

  def total_sales_within_date_range
    orders_within_range = []
    @orders.each do |order|
      if order.placed_at >= @start_date && order.placed_at <= @end_date
        orders_within_range << order
      end
    end

    sum = 0
    orders_within_range.each do |order|
      sum += order.amount
    end
    sum
  end
end

class Order < OpenStruct
end

# So-so code
# Points:
#   Using select method instead of each and if statement
#     The return value of select method is Array
#   One method should have less than 5 lines. However, total_sales_within_date_range has 13 lines
#   Using map and inject method instead of declaring initialized variable for Integer class and each statement to get the sum

class OrdersReport
  def initialize(orders, start_date, end_date)
    @orders = orders
    @start_date = start_date
    @end_date = end_date
  end

  def total_sales_within_date_range
    orders_within_range = @orders.select do |order|
      order.placed_at >= @start_date && order.placed_at <= @end_date
    end

    orders_within_range.map(&:amount).inject(0) do |sum, amount|
      sum + amount
    end
  end
end

class Order < OpenStruct
end

# Good code
# Points:
# Orders_within_range became private method
#   Total_sales_within_date_range is now 3 lines
#     It is much better to have two methods with 3 lines than one method with 6 lines
#
#   Orders_within_range can be used anywhere because it gets separated from total_sales_within_date_range method
#
#   Using private statement implies that you can skip reading it when it is not necessary

class OrdersReport
  def initialize(orders, start_date, end_date)
    @orders = orders
    @start_date = start_date
    @end_date = end_date
  end

  def total_sales_within_date_range
    orders_within_range.map(&:amount).inject(0) do |sum, amount|
      sum + amount
    end
  end

  private
  def orders_within_range
    @orders.select do |order|
      order.placed_between?(@start_date, @end_date)
    end
  end
end

class Order < OpenStruct
  def placed_between?(start_date, end_date)
    placed_at >= start_date && placed_at <= end_date
  end
end