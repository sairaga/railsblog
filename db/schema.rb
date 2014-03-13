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

ActiveRecord::Schema.define(version: 20140313013921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "comments_id"
    t.integer  "posts_id"
    t.integer  "users_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["comments_id"], name: "index_comments_on_comments_id", using: :btree
  add_index "comments", ["posts_id"], name: "index_comments_on_posts_id", using: :btree
  add_index "comments", ["users_id"], name: "index_comments_on_users_id", using: :btree

  create_table "pages", force: true do |t|
    t.integer  "subject_id"
    t.string   "name"
    t.string   "permalink"
    t.integer  "position"
    t.boolean  "visible",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["permalink"], name: "index_pages_on_permalink", using: :btree
  add_index "pages", ["subject_id"], name: "index_pages_on_subject_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "users_id"
  end

  add_index "posts", ["users_id"], name: "index_posts_on_users_id", using: :btree

  create_table "sections", force: true do |t|
    t.integer  "page_id"
    t.string   "name"
    t.integer  "position"
    t.boolean  "visible",      default: false
    t.string   "content_type"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["page_id"], name: "index_sections_on_page_id", using: :btree

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "userid"
    t.string   "name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
