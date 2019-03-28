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

ActiveRecord::Schema.define(version: 20190328160705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "street_number"
    t.string "street_name"
    t.integer "apt_number"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chain_emails", force: :cascade do |t|
    t.string "email_address"
    t.bigint "chain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chain_id"], name: "index_chain_emails_on_chain_id"
  end

  create_table "chain_phone_numbers", force: :cascade do |t|
    t.string "phone_number"
    t.bigint "chain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chain_id"], name: "index_chain_phone_numbers_on_chain_id"
  end

  create_table "chains", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.index ["address_id"], name: "index_chains_on_address_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.integer "num_of_rooms"
    t.integer "rating"
    t.bigint "chain_id"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_hotels_on_address_id"
    t.index ["chain_id"], name: "index_hotels_on_chain_id"
  end

  add_foreign_key "chain_emails", "chains"
  add_foreign_key "chain_phone_numbers", "chains"
  add_foreign_key "chains", "addresses"
  add_foreign_key "hotels", "addresses"
  add_foreign_key "hotels", "chains"
end
