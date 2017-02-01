class CreatesStrftimeFix < ActiveRecord::Migration[5.0]
  def change
    change_column(:stations, :installation_date, :date)
    change_column(:trips, :start_date, :date )
    change_column(:trips, :end_date, :date )
    add_column(:weathers, :date, :date)
  end
end
