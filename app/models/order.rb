class Order < ActiveRecord::Base

  def self.total_by_date(day_num = nil)
    # num_days = nil if num_days.is_a? String
    if day_num
      self.where('orders.created_at > ?', midnight_tonight - day_num.days).count
    else
      self.count
    end
  end

  def self.revenue(days_ago = nil)
    if days_ago
      Order.joins("JOIN order_contents ON orders.id = order_contents.order_id")
        .joins("JOIN products ON products.id = order_contents.product_id")
        .where("checkout_date > ?", (midnight_tonight - days_ago.days))
        .sum("products.price * order_contents.quantity")
    else
      Order.joins("JOIN order_contents ON orders.id = order_contents.order_id")
        .joins("JOIN products ON products.id = order_contents.product_id")
        .where("orders.checkout_date IS NOT NULL")
        .sum("products.price * order_contents.quantity")
    end.to_f
  end

  def self.midnight_tonight
    (Time.now.to_date + 1).to_time
  end
end
