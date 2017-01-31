class AddNullFalseToInstallationDate < ActiveRecord::Migration[5.0]
  def change
        change_column :stations, :installation_date, :date, null: false, after: :city

  end
end
