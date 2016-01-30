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

ActiveRecord::Schema.define(version: 20160130034951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_titles", id: false, force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "title_id",  null: false
    t.index ["author_id", "title_id"], name: "index_authors_titles_on_author_id_and_title_id", using: :btree
    t.index ["title_id", "author_id"], name: "index_authors_titles_on_title_id_and_author_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", using: :btree
  end

  create_table "categories_titles", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "title_id",    null: false
    t.index ["category_id", "title_id"], name: "index_categories_titles_on_category_id_and_title_id", using: :btree
    t.index ["title_id", "category_id"], name: "index_categories_titles_on_title_id_and_category_id", using: :btree
  end

  create_table "editions", force: :cascade do |t|
    t.integer  "year"
    t.integer  "publisher_id"
    t.integer  "title_id"
    t.string   "isbn"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["isbn"], name: "index_editions_on_isbn", using: :btree
  end

  create_table "publishers", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_publishers_on_name", using: :btree
  end

  create_table "titles", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_titles_on_name", using: :btree
  end

  add_foreign_key "editions", "titles"
end
