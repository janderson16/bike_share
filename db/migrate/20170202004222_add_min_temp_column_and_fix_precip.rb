class AddMinTempColumnAndFixPrecip < ActiveRecord::Migration[5.0]
  def change
    add_column(:weathers, :min_temp, :integer)
    change_column(:weathers, :precipitation, :float)
  end
end
