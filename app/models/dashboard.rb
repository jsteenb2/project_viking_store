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

  def calculate_revenue
  end

  def store_days_max

  end
end
