class Dashboard < ActiveRecord::Base

  def overall_platform(num_days = nil)
    num_days = nil if num_days.is_a? String
    stats_hash = {}
    stats_hash[:users] = User.total_by_date(num_days)
    stats_hash[:orders] = Order.total_by_date(num_days)
    stats_hash[:products] = Product.total_by_date(num_days)
    stats_hash[:revenue] = Order.revenue(num_days)
    stats_hash
  end

  def states_by_user_count(num)
    User.select("states.name, COUNT('users.id') AS user_count").joins("JOIN addresses ON billing_id=addresses.id").joins("JOIN states ON state_id=states.id").group("states.name").order("user_count DESC").limit(num)
  end

  def cities_by_user_count(num)
    User.select("cities.name, COUNT('users.id') AS user_count").joins("JOIN addresses ON billing_id=addresses.id").joins("JOIN cities ON state_id=cities.id").group("cities.name").order("user_count DESC").limit(num)
  end
end

# x = Order.find_by_sql('SELECT * FROM orders JOIN order_contents ON orders.id = order_contents.order_id WHERE orders.checkout_date IS NOT NULL')
