class AddMarkHaveProductToProductImage < ActiveRecord::Migration[5.1]
  def change
    add_column :product_images, :have_product, :boolean
  end
end
