class AddDebtersToTeams < ActiveRecord::Migration[5.1]
  def change
  	add_column :teams, :debters, :string, array: true, :default => []
  end
end
