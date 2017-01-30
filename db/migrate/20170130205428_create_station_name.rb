class CreateStationName < ActiveRecord::Migration[5.0]
  def change
    create_table :stations_names do |t|
      t.string :station_name

      t.timestamps null: false
    end
  end
end
