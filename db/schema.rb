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

ActiveRecord::Schema.define(version: 20141217190449) do

  create_table "addresses", force: true do |t|
    t.string   "city"
    t.string   "street"
    t.integer  "buildingNumber"
    t.integer  "flatNumber"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adres", force: true do |t|
    t.string   "miasto"
    t.string   "ulica"
    t.integer  "nr_domu"
    t.integer  "nr_lokalu"
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
