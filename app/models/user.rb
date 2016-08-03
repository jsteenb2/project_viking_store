class User < ActiveRecord::Base

  def self.highest_single_order
    high_user = find_order_cost_max.first
    user = User.find(high_user.user_id)
    user_big_spender = {}
    user_big_spender[:quantity] = high_user.order_total
    user_big_spender[:user] = "#{user.first_name} #{user.last_name}"
    user_big_spender
  end

  def find_order_cost_max
    OrderContent.joins("JOIN orders o ON o.id = order_contents.order_id").joins("JOIN products pr ON pr.id = order_contents.product_id").select("o.id, o.user_id, SUM(quantity * price) AS order_total").group("o.id, o.user_id").order("order_total DESC").limit(1)
  end

  def self.total_by_date(day_num = nil)
    # num_days = nil if num_days.is_a? String
    if day_num
      self.where('users.created_at > ?', midnight_tonight - day_num.days).count
    else
      self.count
    end
  end

  def self.midnight_tonight
    (Time.now.to_date + 1).to_time
  end
end
