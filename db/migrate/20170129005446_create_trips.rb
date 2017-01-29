class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :duration
      t.string :start_date
      t.string :start_station
      t.string :end_date
      t.string :end_station
      t.string :bike_id
      t.string :subscription_type
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
