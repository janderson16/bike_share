class RearrangeForeignKeysForWeatherAndTrip < ActiveRecord::Migration[5.0]
  def change
    add_column(:trips, :weather_id, :integer)
    remove_column(:weathers, :trip_id)
  end
end
