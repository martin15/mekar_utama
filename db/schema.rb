# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160625163010) do

  create_table "banners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "banner_image_file_name"
    t.string "banner_image_content_type"
    t.integer "banner_image_file_size"
    t.datetime "banner_image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "permalink"
    t.integer "parent_id"
  end

  create_table "categories_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.integer "category_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.integer "assetable_id"
    t.string "assetable_type", limit: 30
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
  end

  create_table "clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "name"
    t.boolean "best_client"
    t.string "client_image_file_name"
    t.string "client_image_content_type"
    t.integer "client_image_file_size"
    t.datetime "client_image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "permalink"
  end

  create_table "contact_us", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "email"
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "title"
    t.text "content"
    t.string "news_image_file_name"
    t.string "news_image_content_type"
    t.integer "news_image_file_size"
    t.datetime "news_image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "permalink"
  end

  create_table "product_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "product_image_file_name"
    t.string "product_image_content_type"
    t.integer "product_image_file_size"
    t.datetime "product_image_updated_at"
    t.integer "product_id"
    t.boolean "is_primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_best_seller"
    t.string "note"
    t.boolean "have_product"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "name"
    t.text "description"
    t.float "price", limit: 24
    t.string "code"
    t.string "permalink"
    t.string "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "name"
    t.text "content"
    t.string "setting_image_file_name"
    t.string "setting_image_content_type"
    t.integer "setting_image_file_size"
    t.datetime "setting_image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_captcha_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "key", limit: 40
    t.string "value", limit: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "idx_key"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "email"
    t.string "password_hash"
    t.string "password_salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
