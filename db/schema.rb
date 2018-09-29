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

ActiveRecord::Schema.define(version: 20180929000725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "member_relations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "troupe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "member_requests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "troupe_id"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.integer "troupe_id"
    t.string "flyer_front"
    t.string "flyer_back"
    t.text "caption"
    t.text "story"
    t.text "member"
    t.text "ticket"
    t.date "start_date"
    t.date "end_date"
    t.text "details_datetime"
    t.string "address_zipcode"
    t.string "address_prefecture_name"
    t.string "address_city"
    t.string "address_street"
    t.string "address_bullding"
    t.text "details_access"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "troupe_followings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "troupe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "troupes", force: :cascade do |t|
    t.string "name"
    t.string "caption"
    t.string "icon"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_troupes_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "icon"
    t.boolean "admin_flg", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
