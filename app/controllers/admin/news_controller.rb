class Admin::NewsController < Admin::ApplicationController
  before_filter :find_news, :only => [:destroy, :edit, :update]

  def index
    @all_news = News.paginate(:page => params[:page], :per_page => 5,
                                         :order => "created_at DESC" )
    @no = params[:page].to_i * 5
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(params[:news])
    if @news.save
      flash[:notice] = "News successfully created"
      redirect_to admin_news_index_path
    else
      flash[:error] = "News failed to create"
      render :action => "new"
    end
  end

  def edit; end

  def update
    if @news.update_attributes(params[:news])
      flash[:notice] = "News successfully updated"
      redirect_to admin_news_index_path
    else
      flash[:error] = "News failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @news.destroy ? 'News was successfully deleted.' :
                                      'News was falied to delete.'
    redirect_to admin_news_index_path
  end

  private
    def find_news
      @news = News.find_by_id(params[:id])
      if @news.nil?
        flash[:error] = "Cannot find the News with id '#{params[:id]}'"
        redirect_to admin_news_index_path
      end
    end
end
