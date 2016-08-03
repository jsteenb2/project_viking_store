class DashboardsController < ApplicationController
  def index
    @dash = Dashboard.new.overall_platform
  end
end
