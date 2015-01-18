# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150118170245) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "addresses", force: true do |t|
    t.string   "city"
    t.string   "street"
    t.integer  "buildingNumber"
    t.integer  "flatNumber"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "checkin_malfunctions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checkins", force: true do |t|
    t.integer  "reservation_id"
    t.float    "paid",           limit: 24
    t.date     "startDate"
    t.date     "endDate"
    t.boolean  "keysGiven"
    t.boolean  "keysBack"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checkins", ["reservation_id"], name: "index_checkins_on_reservation_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.integer  "phone"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_orders", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_reservations", force: true do |t|
    t.integer  "reservation_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customer_reservations", ["customer_id"], name: "index_customer_reservations_on_customer_id", using: :btree
  add_index "customer_reservations", ["reservation_id"], name: "index_customer_reservations_on_reservation_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.integer  "address_id"
    t.string   "email"
    t.string   "phone"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["address_id"], name: "index_customers_on_address_id", using: :btree

  create_table "dishes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.integer  "type_id"
    t.integer  "level_id"
    t.integer  "places"
    t.float    "price",      limit: 24
    t.float    "fee",        limit: 24
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["level_id"], name: "index_locations_on_level_id", using: :btree
  add_index "locations", ["type_id"], name: "index_locations_on_type_id", using: :btree

  create_table "malfunctions", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "count"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: true do |t|
    t.integer  "location_id"
    t.date     "startDate"
    t.date     "endDate"
    t.integer  "reservationNumber"
    t.boolean  "deposit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reservations", ["location_id"], name: "index_reservations_on_location_id", using: :btree

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
