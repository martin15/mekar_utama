class CreateContactUs < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_us do |t|
      t.string :email
      t.string :name
      t.text :content
      t.timestamps
    end
  end
end
