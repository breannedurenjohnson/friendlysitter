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

ActiveRecord::Schema.define(version: 20191219150333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "compliments", force: :cascade do |t|
    t.string   "content"
    t.integer  "parent_id"
    t.integer  "sitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_compliments_on_parent_id", using: :btree
    t.index ["sitter_id"], name: "index_compliments_on_sitter_id", using: :btree
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hires", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "sitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_hires_on_parent_id", using: :btree
    t.index ["sitter_id"], name: "index_hires_on_sitter_id", using: :btree
  end

  create_table "parents", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "password_confirmation"
    t.string   "avatar"
    t.string   "about"
    t.string   "city"
    t.string   "state"
  end

  create_table "sitters", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "about"
    t.integer  "hourly_rate"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "password_confirmation"
    t.string   "avatar"
    t.string   "city"
    t.string   "state"
  end

  add_foreign_key "compliments", "parents"
  add_foreign_key "compliments", "sitters"
  add_foreign_key "hires", "parents"
  add_foreign_key "hires", "sitters"
end
