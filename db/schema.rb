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

ActiveRecord::Schema.define(version: 2019_06_11_235937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "kind_transactions", force: :cascade do |t|
    t.string "description", null: false
    t.integer "nature", null: false
    t.integer "signal", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_values", force: :cascade do |t|
    t.datetime "date_occurrency", null: false
    t.decimal "value", precision: 15, scale: 2, null: false
    t.string "cpf", null: false
    t.string "card", null: false
    t.string "owner", null: false
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.bigint "kind_transaction_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kind_transaction_id"], name: "index_transaction_values_on_kind_transaction_id"
    t.index ["user_id"], name: "index_transaction_values_on_user_id"
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
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "transaction_values", "kind_transactions"
  add_foreign_key "transaction_values", "users"
end
