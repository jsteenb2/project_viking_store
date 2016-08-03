class Dashboard < ActiveRecord::Base

  def overall_platform(num_days = nil)
    return_hash = {}
    if num_days

    else
      # total users, orders, products, revenue
      return_hash[:users] = User.count
      return_hash[:orders] = Order.count
      return_hash[:products] = Product.count
      return_hash[:users] = User.count
    end
  end

  def calculate_revenue(days_ago = nil)
    if days
      total_costs = Order.find_by_sql('SELECT SUM(products.price * order_contents.quantity) as total FROM orders JOIN order_contents ON orders.id = order_contents.order_id JOIN products ON products.id = order_contents.product_id WHERE orders.checkout_date IS NOT NULL AND checkout_date is > ?', (midnight_tonight - days_ago))
    else
      total_costs = Order.find_by_sql('SELECT SUM(products.price * order_contents.quantity) as total FROM orders JOIN order_contents ON orders.id = order_contents.order_id JOIN products ON products.id = order_contents.product_id WHERE orders.checkout_date IS NOT NULL')
    end
  end

  def store_days_max

  end
end

# x = Order.find_by_sql('SELECT * FROM orders JOIN order_contents ON orders.id = order_contents.order_id WHERE orders.checkout_date IS NOT NULL')
