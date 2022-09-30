class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.string :news_image_file_name
      t.string :news_image_content_type
      t.integer :news_image_file_size
      t.datetime :news_image_updated_at
      t.timestamps
    end
  end
end
