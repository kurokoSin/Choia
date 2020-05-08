class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: false, primary_key: [:uid, :privateid] do  |t|
      t.string :uid
      t.string :privateid

      t.timestamps
    end
  end
end
