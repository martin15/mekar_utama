class AddIsBestSellerToProductImage < ActiveRecord::Migration[5.1]
  def change
    add_column :product_images, :is_best_seller, :boolean
  end
end
