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

ActiveRecord::Schema.define(version: 2019_09_06_154749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.string "en_name"
    t.bigint "prefecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_areas_on_prefecture_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.integer "type", default: 0, null: false
    t.string "name"
    t.string "tel"
    t.bigint "prefecture_id"
    t.bigint "category_id"
    t.integer "birth_of_year"
    t.string "activity_scope"
    t.string "features"
    t.integer "num_of_sheets"
    t.time "opening_time"
    t.time "closing_time"
    t.integer "since"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "address1"
    t.string "city"
    t.index ["category_id"], name: "index_customers_on_category_id"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["prefecture_id"], name: "index_customers_on_prefecture_id"
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "region_id"
    t.string "en_name"
    t.index ["region_id"], name: "index_prefectures_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.string "en_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "salons_reservation_id", null: false
    t.integer "stylists_reservation_id", null: false
    t.integer "stylists_menu_id", null: false
    t.bigint "customer_id"
    t.text "memo"
    t.boolean "status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "finish_salon", default: false, null: false
    t.boolean "finish_stylist", default: false, null: false
    t.text "salon_memo"
    t.text "stylist_memo"
    t.index ["customer_id"], name: "index_reservations_on_customer_id"
    t.index ["salons_reservation_id"], name: "index_reservations_on_salons_reservation_id", unique: true
    t.index ["stylists_menu_id"], name: "index_reservations_on_stylists_menu_id"
    t.index ["stylists_reservation_id"], name: "index_reservations_on_stylists_reservation_id", unique: true
  end

  create_table "salons_reservations", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.datetime "reservation_time"
    t.integer "operation_time"
    t.text "memo"
    t.boolean "status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_salons_reservations_on_customer_id"
    t.index ["reservation_time"], name: "index_salons_reservations_on_reservation_time"
  end

  create_table "stylists_menus", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "name", null: false
    t.integer "price", null: false
    t.integer "operation_time", null: false
    t.string "content", null: false
    t.string "sales_copy"
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_stylists_menus_on_customer_id"
  end

  create_table "stylists_reservations", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.datetime "reservation_time"
    t.integer "operation_time"
    t.string "activity_scope"
    t.text "memo"
    t.boolean "status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_stylists_reservations_on_customer_id"
    t.index ["reservation_time"], name: "index_stylists_reservations_on_reservation_time"
  end

  add_foreign_key "areas", "prefectures"
  add_foreign_key "customers", "categories"
  add_foreign_key "customers", "prefectures"
  add_foreign_key "prefectures", "regions"
  add_foreign_key "reservations", "customers"
  add_foreign_key "reservations", "salons_reservations"
  add_foreign_key "reservations", "stylists_reservations"
  add_foreign_key "salons_reservations", "customers"
  add_foreign_key "stylists_menus", "customers"
  add_foreign_key "stylists_reservations", "customers"
end
