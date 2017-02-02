class ChangeForeignKeysInTrip < ActiveRecord::Migration[5.0]
  def change
    remove_columns(:trips, *:subscription_id, :bike_id )
    add_column(:trips, :subscription_id, :integer)
    add_column(:trips, :bike_id, :integer)
  end
end
