class Product < ActiveRecord::Base
  def self.total_by_date(day_num = nil)
    # num_days = nil if num_days.is_a? String
    if day_num
      self.where('products.created_at > ?', midnight_tonight - day_num.days).count
    else
      self.count
    end
  end

  def self.midnight_tonight
    (Time.now.to_date + 1).to_time
  end
end
