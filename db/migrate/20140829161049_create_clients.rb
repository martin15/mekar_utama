class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.boolean :best_client
      t.string :client_image_file_name
      t.string :client_image_content_type
      t.integer :client_image_file_size
      t.datetime :client_image_updated_at
      t.timestamps
    end
  end
end
