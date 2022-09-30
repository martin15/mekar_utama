class Admin::ProductImagesController < Admin::ApplicationController
  before_filter :find_product, :only => [:create, :show, :destroy,
                                          :edit, :update, :set_primary, :set_best_seller]
  before_filter :find_product_image, :only => [:show, :destroy, :edit, :new_product, :create_product, 
                                               :update, :set_primary, :set_best_seller]

  def index
    if params[:opt] == "with_product"
      @product_images = ProductImage.with_product.paginate(:page => params[:page], :per_page => 20)
    else
      @product_images = ProductImage.without_product.paginate(:page => params[:page], :per_page => 20)
    end
    @no = params[:page].nil? ? 0 : (params[:page].to_i-1) * 20
  end

  def new_product
    @product = Product.new
    @product.product_images.build
    @category_list = Category.category_list
    @product_category = []
  end

  def create_product
    @product = Product.new(params[:product])
    @product.image = @product_image.product_image
    if @product.save
      update_categories
      @product_image.update_attribute(:have_product, true)
      flash[:notice] = "Product successfully created"
      redirect_to admin_product_images_path
    else
      @product_category = params[:product][:category_id].blank? ? [] : params[:product][:category_id].map(&:to_i)
      flash[:error] = "Product failed to create"
      render :action => "new_product"
    end
  end

  def create
    @product_image = ProductImage.new(:product_image => params[:product][:product_image])
    @product_image.product_id = params[:product_id]
    if @product_image.save
      flash[:notice] = "Product Image successfully created"
    else
      flash[:error] = "Product Image failed to create"
    end
    redirect_to admin_product_path(@product.id)
  end

  def edit; end

  def update
    if @product_image.update_attributes(params[:product_image])
      flash[:notice] = "Product Image successfully updated"
      redirect_to admin_product_path(@product.id)
    else
      flash[:error] = "Product Image failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] = @product_image.destroy ? 'Product Image was successfully deleted.' :
                                      'Product Image was falied to delete.'
    redirect_to admin_product_path(@product.id)
  end

  def set_primary
    if @product_image.change_primary_image
      flash[:notice] = "Product Image successfully set as Primary Image"
    else
      flash[:error] = "Product Image failed to set as Primary Image"
    end
    redirect_to admin_product_path(@product.id)
  end

  def set_best_seller
    best = params[:is_best_seller] == "true" ? true : false
    respond_to do |format|
      if @product_image.update_attribute(:is_best_seller, best)
        format.html { redirect_to(admin_product_path(@product.id),
                      :notice => 'Image was successfully updated.') }
        format.js
      end
    end

  end

  private
    def find_product
      @product = Product.find_by_id(params[:product_id])
      if @product.nil?
        flash[:error] = "Cannot find the Product with id '#{params[:product_id]}'"
        redirect_to admin_products_path
      end
    end

    def find_product_image
      @product_image = ProductImage.find_by_id(params[:id])
      if @product_image.nil?
        flash[:error] = "Cannot find the Product Image with id '#{params[:id]}'"
        redirect_to admin_product_path(@product.id)
      end
    end

    def update_categories
      @categories = Category.where("id in (?)", params[:product][:category_id])
      @product.categories = @categories
      @product.save
    end
end
