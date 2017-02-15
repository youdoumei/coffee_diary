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

ActiveRecord::Schema.define(version: 20170129064439) do

  create_table "entries", force: :cascade do |t|
    t.integer  "entrynumber",          limit: 4,   null: false
    t.integer  "scale_templatenumber", limit: 4,   null: false
    t.string   "comment",              limit: 255, null: false
    t.date     "entrydate",                        null: false
    t.integer  "value1",               limit: 4,   null: false
    t.integer  "value2",               limit: 4,   null: false
    t.integer  "value3",               limit: 4,   null: false
    t.integer  "value4",               limit: 4,   null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.integer  "entry_id",           limit: 4
  end

  add_index "images", ["entry_id"], name: "index_images_on_entry_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "entry_id",           limit: 4
    t.binary   "data",               limit: 4294967295
    t.string   "content_typet",      limit: 255
    t.string   "content_type",       limit: 255
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
  end

  add_index "pictures", ["entry_id"], name: "index_pictures_on_entry_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "hashed_password", limit: 255
  end

end
