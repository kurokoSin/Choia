class CreateComixes < ActiveRecord::Migration[6.0]
  def change
    create_table :comixes do |t|
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

      t.timestamps
    end
  end
end
