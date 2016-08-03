module DashboardsHelper
  def midnight_tonight
    (Time.now.to_date + 1).to_time
  end
end
