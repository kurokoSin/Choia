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

ActiveRecord::Schema.define(version: 2019_09_09_145344) do

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "publisher"
    t.string "comic_name"
    t.string "book_name"
    t.string "author"
    t.datetime "publish_date"
    t.string "is_adult"
    t.string "book_image"
    t.string "isbn_code"
    t.string "other_info"
    t.string "seies_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
