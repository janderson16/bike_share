class RemovesStationsIdTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :stations_names
  end
end
