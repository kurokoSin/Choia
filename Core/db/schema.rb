# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_08_005859) do

  create_table "comixes", force: :cascade do |t|
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "series", id: false, force: :cascade do |t|
    t.string "sid"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "series_aliases", id: false, force: :cascade do |t|
    t.string "sid"
    t.string "aname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "series_tags", id: false, force: :cascade do |t|
    t.string "sid"
    t.string "tid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", id: false, force: :cascade do |t|
    t.string "tid"
    t.string "tname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.string "week"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_favorits", id: false, force: :cascade do |t|
    t.string "uid"
    t.string "sid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", id: false, force: :cascade do |t|
    t.string "uid"
    t.string "privateid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
