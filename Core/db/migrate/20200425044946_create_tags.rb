class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags, id: false, primary_key: [:tid, :tname] do |t|
      t.string :tid
      t.string :tname

      t.timestamps
    end
  end
end
