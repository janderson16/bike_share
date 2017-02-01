class CreatesStrftimeFix < ActiveRecord::Migration[5.0]
  def change
    change_column(:stations, :installation_date, :string)
    change_column(:trips, :start_date, :string )
    change_column(:trips, :end_date, :string )
    add_column(:weathers, :date, :string)
  end
end
