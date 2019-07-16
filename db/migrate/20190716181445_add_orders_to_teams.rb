class AddOrdersToTeams < ActiveRecord::Migration[5.1]
  def change
  	add_column :teams, :orders, :string, array: true, :default => []
  end
end
