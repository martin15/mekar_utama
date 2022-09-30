class AddPermalink < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :permalink, :string
    add_column :clients, :permalink, :string
    add_column :categories, :permalink, :string
  end
end
