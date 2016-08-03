class Dashboard < ActiveRecord::Base

  def overall_platform(num_days = nil)
    return_hash = {}
    if num_days

    else
      # total users, orders, products, revenue
      return_hash[:users] = User.count
      return_hash[:orders] = Order.count
      return_hash[:products] = Product.count
      return_hash[:revenue] = Order.revenue(num_days)
    end
    return_hash
  end

  def midnight_tonight
    (Time.now.to_date + 1).to_time
  end

  def store_days_max

  end
end

# x = Order.find_by_sql('SELECT * FROM orders JOIN order_contents ON orders.id = order_contents.order_id WHERE orders.checkout_date IS NOT NULL')
