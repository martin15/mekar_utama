class AboutUsController < ApplicationController

  def index
    @about_us = Setting.find_by_name(:about_us)
  end
end
