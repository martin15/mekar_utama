class Category < ActiveRecord::Base
  # attr_accessible :name, :parent_id, :permalink
  has_permalink :name, :update => true

  has_many :child_categories, :class_name => "Category", :foreign_key => :parent_id
  belongs_to :parent_category, :class_name => "Category", :foreign_key => :parent_id

  has_many :categories_products
  has_many :products, :through => :categories_products

  def self.parent_categories
    where("parent_id is null")
  end

  def self.category_list
    all.map{|category| [category.name, category.id]}
  end

  def self.child_categories
    where("parent_id is not null")
  end
end
