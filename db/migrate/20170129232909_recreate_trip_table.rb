class RecreateTripTable < ActiveRecord::Migration[5.0]
  def change

    create_table :trips do |t|
      t.integer :duration
      t.datetime :start_date
      t.string :start_station_name
      t.integer :start_station_id
      t.datetime :end_date
      t.string :end_station_name
      t.integer :end_station_id
      t.string :bike_id
      t.string :subscription_type
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
