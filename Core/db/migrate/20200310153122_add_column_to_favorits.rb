class AddColumnToFavorits < ActiveRecord::Migration[6.0]
  def change
    add_column :favorits, :week, :string
  end
end
