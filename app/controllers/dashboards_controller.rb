class DashboardsController < ApplicationController
  def index
    @dash = Dashboard.new
  end
end
