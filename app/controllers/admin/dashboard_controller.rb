class Admin::DashboardController < Admin::ApplicationController

  def index
    @red_info = Setting.find_by_id(3)
    @blue_info = Setting.find_by_id(4)
  end

end
