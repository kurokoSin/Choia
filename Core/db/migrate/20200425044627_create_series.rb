class CreateSeries < ActiveRecord::Migration[6.0]
  def change
    create_table :series, id: false, primary_key: :sid do |t|
      t.string :sid
      t.string :name

      t.timestamps
    end
  end
end
