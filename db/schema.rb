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

ActiveRecord::Schema.define(version: 2020_06_24_095457) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "customer_id"
    t.string "contact_name"
    t.string "contact_email"
    t.text "contact_content"
    t.integer "contact_status", default: 0, null: false
    t.boolean "task_status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name_sei"
    t.string "name_mei"
    t.string "yomi_sei"
    t.string "yomi_mei"
    t.string "nickname"
    t.string "postal_code"
    t.string "prefecture_code"
    t.string "address_city"
    t.string "address_street"
    t.string "tell"
    t.string "password"
    t.boolean "customer_status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "customer_picture_id"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name"
    t.integer "genre_status", default: 0, null: false
    t.boolean "genre_valid", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gym_comments", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "gym_id"
    t.string "gym_title"
    t.text "gym_comment"
    t.float "gym_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gym_favorites", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "gym_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gyms", force: :cascade do |t|
    t.integer "genre_id"
    t.string "gym_name"
    t.text "gym_description"
    t.string "gym_tell"
    t.string "gym_postal_code"
    t.string "gym_address"
    t.string "prefecture_code"
    t.string "address_city"
    t.string "address_street"
    t.text "gym_picture_id"
    t.string "gym_brand"
    t.boolean "gym_valid", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "admin_user_id"
    t.index ["admin_user_id"], name: "index_gyms_on_admin_user_id"
  end

  create_table "product_comments", force: :cascade do |t|
    t.integer "product_id"
    t.string "product_title"
    t.text "product_comment"
    t.float "product_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
  end

  create_table "product_favorites", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "genre_id"
    t.string "product_name"
    t.text "product_description"
    t.integer "product_price"
    t.text "product_picture_id"
    t.string "product_brand"
    t.boolean "product_valid", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservation_managements", force: :cascade do |t|
    t.integer "reservation_id"
    t.integer "gym_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "customer_id"
    t.string "full_name"
    t.string "postal_code"
    t.string "address"
    t.integer "sex", default: 0, null: false
    t.integer "age"
    t.string "email"
    t.string "tell"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "reservation_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gym_id"
    t.index ["gym_id"], name: "index_reservations_on_gym_id"
  end

end
