class AddOutlaysToTeams < ActiveRecord::Migration[5.1]
  def change
  	add_column :teams, :outlays, :string, array: true, :default => []
  end
end
