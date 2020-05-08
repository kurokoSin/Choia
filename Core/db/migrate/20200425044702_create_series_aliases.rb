class CreateSeriesAliases < ActiveRecord::Migration[6.0]
  def change
    create_table :series_aliases, id: false, primary_key: [:sid, :aname] do |t|
      t.string :sid
      t.string :aname

      t.timestamps
    end
  end
end
