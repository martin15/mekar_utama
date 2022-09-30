class Admin::CategoriesController < Admin::ApplicationController
  before_filter :find_category, :only => [:destroy, :edit, :update]

  def index
    @categories = Category.paginate(:page => params[:page], :per_page => 10,
                                         :order => "created_at DESC" )
    @no = params[:page].to_i * 10
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Category successfully created"
      redirect_to admin_categories_path
    else
      flash[:error] = "Category failed to create"
      render :action => "new"
    end
  end

  def edit; end

  def update
    if @category.update_attributes(params[:category])
      flash[:notice] = "Category successfully updated"
      redirect_to admin_categories_path
    else
      flash[:error] = "Category failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @category.destroy ? 'Category was successfully deleted.' :
                                      'Category was falied to delete.'
    redirect_to admin_categories_path
  end

  private
    def find_category
      @category = Category.find_by_id(params[:id])
      if @category.nil?
        flash[:error] = "Cannot find the Category with id '#{params[:id]}'"
        redirect_to admin_categories_path
      end
    end
end
