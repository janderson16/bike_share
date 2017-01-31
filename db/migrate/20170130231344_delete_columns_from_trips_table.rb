class DeleteColumnsFromTripsTable < ActiveRecord::Migration[5.0]
  def change
    remove_columns(:trips, *:start_station_name, :end_station_name )
  end
end
