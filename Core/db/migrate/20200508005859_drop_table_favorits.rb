class DropTableFavorits < ActiveRecord::Migration[6.0]
  def change
    drop_table :favorits
  end
end
