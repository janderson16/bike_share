class CreateStationTableWithCity < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.integer :station_name_id
      t.integer :dock_count
      t.integer :city_id
      t.date :installation_date

      t.timestamps null: false
    end
  end
end
