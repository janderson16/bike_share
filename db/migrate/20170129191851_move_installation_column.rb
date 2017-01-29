class MoveInstallationColumn < ActiveRecord::Migration[5.0]
  def change

    change_column :stations, :installation_date, :date, after: :city
  end
end
