class HomeController < ApplicationController
  before_action :find_category, :only => [:index]
  before_action :find_product, :only => [:show]

  def index
    @web_banners = Banner.order("created_at DESC") #Banner.where("b_type = 'web' or b_type = '' or b_type is null ")
    @mobile_banners = [] #Banner.where("b_type = 'mobile'")

    @contact = ContactUs.new
    @pencil_ids = Category.find_by_permalink('pencil').child_categories.map(&:id)
    @embroidery_ids = Category.find_by_permalink('embroidery').child_categories.map(&:id)
    @pencil_products =  Product.joins(:categories).where("categories.id in (?)", @pencil_ids).limit(3)
    @embroidery_products = Product.joins(:categories).where("categories.id in (?)", @embroidery_ids).limit(3)

    @child_categories =  @category.child_categories
    @products = Product.joins("left join categories_products as cp on cp.product_id = products.id").
      where("cp.category_id in (?)", @child_categories.map(&:id)).uniq

    @clients = Client.all
    # @banners = Banner.order("created_at DESC")
    # @best_sellers = ProductImage.where("is_best_seller = true").limit(6)
    # @best_clients = Client.where("best_client = true").limit(7)
    # @latest_news = News.order("created_at DESC").limit(2)
    # @red_info = Setting.find_by_id(3)
    # @blue_info = Setting.find_by_id(4)
  end
  
  private
    def find_category
      @category = Category.includes(:products).find_by_name('Pencil')
      if @category.nil?
        flash[:error] = "Cannot find the category"
        redirect_to root_path
      end
    end

    def find_product
      @product = Product.find_by_permalink(params[:permalink])
      if @product.nil?
        flash[:error] = "Cannot find the Product"
        redirect_to root_path
      end
    end
end
