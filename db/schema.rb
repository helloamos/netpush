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

ActiveRecord::Schema.define(version: 20170713145355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "campaign_type"
    t.string "campaign_name"
    t.string "sender"
    t.string "recipient"
    t.string "object"
    t.text "content"
    t.string "statut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mail_broadcast_lists", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "contact_number", default: 0
    t.string "status", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mail_broadcast_lists_on_user_id"
  end

  create_table "mail_lists", force: :cascade do |t|
    t.string "full_name"
    t.string "phone"
    t.string "city"
    t.string "country"
    t.string "email", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mail_lists_on_user_id"
  end

  create_table "phone_broadcast_lists", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "status", null: false
    t.integer "contact_number", default: 0
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_phone_broadcast_lists_on_user_id"
  end

  create_table "phone_lists", force: :cascade do |t|
    t.string "full_name"
    t.string "phone", null: false
    t.string "city"
    t.string "country"
    t.string "email"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_phone_lists_on_user_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.string "company"
    t.string "address"
    t.string "phone"
    t.string "country"
    t.string "city"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
