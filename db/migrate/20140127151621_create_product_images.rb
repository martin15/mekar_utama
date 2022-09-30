class CreateProductImages < ActiveRecord::Migration[5.1]
  def change
    create_table :product_images do |t|
      t.string :product_image_file_name
      t.string :product_image_content_type
      t.integer :product_image_file_size
      t.datetime :product_image_updated_at
      t.integer :product_id
      t.boolean :is_primary
      t.timestamps
    end
  end
end
