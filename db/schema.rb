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

ActiveRecord::Schema.define(version: 2019_05_21_143429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salons", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "prefecture_id"
    t.string "name"
    t.string "place"
    t.string "tel"
    t.string "features"
    t.integer "num_of_stylists"
    t.integer "num_of_sheets"
    t.time "opening_time"
    t.time "closing_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["category_id"], name: "index_salons_on_category_id"
    t.index ["email"], name: "index_salons_on_email", unique: true
    t.index ["prefecture_id"], name: "index_salons_on_prefecture_id"
    t.index ["reset_password_token"], name: "index_salons_on_reset_password_token", unique: true
  end

  create_table "stylists", force: :cascade do |t|
    t.string "name"
    t.bigint "prefecture_id"
    t.bigint "category_id"
    t.bigint "salon_id"
    t.string "active_scope"
    t.string "tel"
    t.string "features"
    t.integer "history_of_stylist"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["category_id"], name: "index_stylists_on_category_id"
    t.index ["email"], name: "index_stylists_on_email", unique: true
    t.index ["prefecture_id"], name: "index_stylists_on_prefecture_id"
    t.index ["reset_password_token"], name: "index_stylists_on_reset_password_token", unique: true
    t.index ["salon_id"], name: "index_stylists_on_salon_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "tel"
    t.string "email"
    t.bigint "prefecture_id"
    t.string "place"
    t.integer "birth_of_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_users_on_prefecture_id"
  end

  add_foreign_key "salons", "categories"
  add_foreign_key "salons", "prefectures"
  add_foreign_key "stylists", "categories"
  add_foreign_key "stylists", "prefectures"
  add_foreign_key "stylists", "salons"
  add_foreign_key "users", "prefectures"
end
