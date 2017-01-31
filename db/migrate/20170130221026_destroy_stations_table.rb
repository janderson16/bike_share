class DestroyStationsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :stations
  end
end
