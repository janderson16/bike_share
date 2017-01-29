class AddInstallationDateColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :installation_date, :date
  end
end
