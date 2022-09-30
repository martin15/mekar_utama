class CategoriesProduct < ActiveRecord::Base
  # attr_accessible :product_id, :category_id

  belongs_to :category
  belongs_to :product
end
