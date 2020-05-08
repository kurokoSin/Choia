class CreateUserFavorits < ActiveRecord::Migration[6.0]
  def change
    create_table :user_favorits, id: false, primary_key: [:uid, :sid] do |t|
      t.string :uid
      t.string :sid

      t.timestamps
    end
  end
end
