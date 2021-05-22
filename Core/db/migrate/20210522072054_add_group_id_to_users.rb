class AddGroupIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :groupid, :string
  end
end
