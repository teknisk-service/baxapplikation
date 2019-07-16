class AddOrderItemsToTeams < ActiveRecord::Migration[5.1]
  def change
  	add_column :teams, :order_items, :string, array: true, :default => []
  end
end
