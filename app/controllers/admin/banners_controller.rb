class Admin::BannersController < Admin::ApplicationController
  before_filter :find_banner, :only => [:destroy, :edit, :update]

  def index
    @banners = Banner.paginate(:page => params[:page], :per_page => 5,
                                         :order => "created_at DESC" )
    @no = params[:page].to_i * 5
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(params[:banner])
    if @banner.save
      flash[:notice] = "Banner successfully created"
      redirect_to admin_banners_path
    else
      flash[:error] = "Banner failed to create"
      render :action => "new"
    end
  end

  def edit; end

  def update
    if @banner.update_attributes(params[:banner])
      flash[:notice] = "Banner successfully updated"
      redirect_to admin_banners_path
    else
      flash[:error] = "Banner failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @banner.destroy ? 'Banner was successfully deleted.' :
                                      'Banner was falied to delete.'
    redirect_to admin_banners_path
  end

  private
    def find_banner
      @banner = Banner.find_by_id(params[:id])
      if @banner.nil?
        flash[:error] = "Cannot find the Banner with id '#{params[:id]}'"
        redirect_to admin_banners_path
      end
    end
end
