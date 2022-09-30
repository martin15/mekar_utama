class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.string :name
      t.text :content
      t.string :setting_image_file_name
      t.string :setting_image_content_type
      t.integer :setting_image_file_size
      t.datetime :setting_image_updated_at
      t.timestamps
    end
  end
end
