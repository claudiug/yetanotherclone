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

ActiveRecord::Schema.define(version: 20150303180151) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "price",        default: 100
    t.string   "location"
    t.string   "contact"
    t.string   "company_name"
    t.string   "url"
    t.string   "email"
    t.boolean  "highlight",    default: false
    t.datetime "valid_time"
    t.integer  "total_price"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "category_id"
    t.boolean  "is_active",    default: false
    t.float    "latitude"
    t.float    "longitude"
  end

end
