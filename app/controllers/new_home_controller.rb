class NewHomeController < ApplicationController
layout "new-application"

  def index
    @banners = Banner.order("created_at DESC")
    @best_sellers = ProductImage.where("is_best_seller = true").limit(6)
    @best_clients = Client.where("best_client = true").limit(7)
    @latest_news = News.order("created_at DESC").limit(2)
    @red_info = Setting.find_by_id(3)
    @blue_info = Setting.find_by_id(4)
  end
end
