class NewsController < ApplicationController

  def index
    @all_news = News.paginate(:page => params[:page], :per_page => 5,
                                         :order => "created_at DESC" )
  end

  def show
    @news = News.find_by_permalink(params[:id])
    if @news.nil?
      flash[:error] = "Cannot find the News with id '#{params[:id]}'"
      redirect_to news_path
    end
  end
end
