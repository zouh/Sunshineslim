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

ActiveRecord::Schema.define(version: 20140103124427) do

  create_table "_nutrition_facts_old_20131223", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "size_unit"
    t.decimal  "size"
    t.decimal  "serving_size"
    t.decimal  "servings"
    t.decimal  "energy"
    t.integer  "energy_unit"
    t.integer  "energy_percent"
    t.decimal  "protein"
    t.integer  "protein_percent"
    t.decimal  "fat"
    t.integer  "fat_percent"
    t.decimal  "carbohydrate"
    t.integer  "carbohydrate_percent"
    t.decimal  "sodium"
    t.integer  "sodium_percent"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "nutrition_facts", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "size_unit"
    t.decimal  "size"
    t.decimal  "serving_size"
    t.decimal  "servings"
    t.decimal  "energy"
    t.integer  "energy_percent"
    t.decimal  "protein"
    t.integer  "protein_percent"
    t.decimal  "fat"
    t.integer  "fat_percent"
    t.decimal  "carbohydrate"
    t.integer  "carbohydrate_percent"
    t.decimal  "sodium"
    t.integer  "sodium_percent"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nutrition_facts", ["code"], name: "index_nutrition_facts_on_code"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "unit_groups", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "unit_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "units", ["code"], name: "index_units_on_code", unique: true

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
