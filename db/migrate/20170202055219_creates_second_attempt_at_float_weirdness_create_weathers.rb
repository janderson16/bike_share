class CreatesSecondAttemptAtFloatWeirdnessCreateWeathers < ActiveRecord::Migration[5.0]
  def change
    create_table :weathers do |t|
      t.integer :max_temp
      t.integer :mean_temp
      t.integer :mean_humidity
      t.integer :mean_visibility_miles
      t.integer :mean_wind_speed
      t.float :precipitation
      t.integer :trip_id
      t.integer :min_temp
      t.date :date
    end
  end
end
