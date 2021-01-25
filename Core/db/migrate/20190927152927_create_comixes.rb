class CreateComixes < ActiveRecord::Migration[6.0]
  def change
    create_table :comixes do |t|
      t.string "name",          comment: "本の名前"
      t.string "publisher",     comment: "出版社"
      t.string "comic_name",    comment: "コミックのシリーズ名"
      t.string "book_name",     comment: ""
      t.string "author",        comment: "作者"
      t.datetime "publish_date"
      t.string "is_adult"
      t.string "book_image"
      t.string "isbn_code"
      t.string "other_info"
      t.string "series_name"

      t.timestamps
    end
  end
end
