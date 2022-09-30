class ProductImage < ActiveRecord::Base
  attr_accessor :set_primary_image
  # attr_accessible :product_image, :product_id, :is_primary, :is_best_seller, :note
  belongs_to :product

  has_attached_file :product_image, :url => ":rails_root/system/:attachment/:id/:style/:basename.:extension", :styles => { :thumb => "125x125",
                                                 :medium => "300x300",
                                                 :large => "600x600" }
  validates_attachment_presence :product_image
  after_destroy :set_primary_image
  after_create :set_primary_image
  # scope :primary, :conditions => "is_primary = 1"

  def self.primary
    self.where("is_primary = 1")
  end

  def self.with_product
    self.where("have_product = 1")
  end

  def self.without_product
    self.where("have_product = 0 or have_product is null")
  end

  def is_primary?
    !!is_primary
  end

  def change_primary_image
    product = self.product
    old_primary_image = product.product_images.primary.first
    unless old_primary_image.nil?
      #return false unless old_primary_image.unset_primary
      product.unset_primary
    end
    self.set_primary
    return self.save
  end

  def set_primary_image
    product = self.product
    return unless product.product_images.primary.first.nil?
    new_pimary_image = product.product_images.first
    unless new_pimary_image.nil?
      new_pimary_image.update_attribute :is_primary, true
    end
  end

  def unset_primary
    self.is_primary = false
    self.save!
  end

  protected
    def set_primary
      self.is_primary = true
    end
end
