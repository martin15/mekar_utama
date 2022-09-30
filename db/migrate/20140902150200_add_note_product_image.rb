class AddNoteProductImage < ActiveRecord::Migration[5.1]
  def change
    add_column :product_images, :note, :string
  end
end
