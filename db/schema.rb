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

ActiveRecord::Schema.define(version: 2019_07_06_050705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

  create_table "salons_reservations", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.datetime "reservation_time"
    t.text "memo"
    t.boolean "status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "operation_time"
    t.index ["customer_id"], name: "index_salons_reservations_on_customer_id"
  end

  create_table "stylists_reservations", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.datetime "reservation_time"
    t.time "operation_time"
    t.string "activity_scope"
    t.text "memo"
    t.boolean "status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_stylists_reservations_on_customer_id"
  end

  add_foreign_key "customers", "categories"
  add_foreign_key "customers", "prefectures"
  add_foreign_key "salons_reservations", "customers"
  add_foreign_key "stylists_reservations", "customers"
end
