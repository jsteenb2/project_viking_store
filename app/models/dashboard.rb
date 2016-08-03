class Dashboard < ActiveRecord::Base

  def overall_platform(num_days = nil)
    num_days ||= store_days_max
  end

  def store_days_max

  end
end
