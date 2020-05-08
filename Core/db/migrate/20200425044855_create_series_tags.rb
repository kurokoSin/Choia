class CreateSeriesTags < ActiveRecord::Migration[6.0]
  def change
    create_table :series_tags, id: false, primary_key: [:sid, :tid] do |t|
      t.string :sid
      t.string :tid

      t.timestamps
    end
  end
end
