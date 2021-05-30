class AddUserColumnDelay < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :delay, :integer
  end
end
