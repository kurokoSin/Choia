class AddColumnSeriesAliases < ActiveRecord::Migration[6.0]
  def change
    # alias_type: 0=series, 1=aliases
    add_column :series_aliases, :alias_type, :string, comment: "別名の種類 1=別の呼び方 2=同一シリーズ"
  end
end
