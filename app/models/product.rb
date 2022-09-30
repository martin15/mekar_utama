class Product < ActiveRecord::Base
  # attr_accessible :name, :description, :price, :code, :permalink, :category_id, :product_images_attributes,
  #                 :image
  has_permalink :name, :update => true

  has_many :categories_products
  has_many :categories, :through => :categories_products

  has_many :product_images, :dependent => :destroy
  accepts_nested_attributes_for :product_images, :allow_destroy => true

  has_attached_file :image, :url => "/system/:attachment/:id/:style/:basename.:extension", 
                            :styles => { :thumb => "125x125",
                                         :medium => "300x300",
                                         :large => "600x600" }
  validates_attachment_presence :image
  validates :name, :presence => true,
                   :length => {:minimum => 1, :maximum => 254}
#  validates :price, :presence => true,
#                    :length => {:minimum => 1, :maximum => 254},
#                    :numericality => true

  def primary_image(size)
    img = product_images.primary.first
    return "undefined" if img.nil?
    img.product_image.url(size.to_sym)
  end

  def unset_primary
    product_images.each do |image|
      if image.is_primary?
        image.is_primary = false
        image.save!
      end
    end
  end

end
