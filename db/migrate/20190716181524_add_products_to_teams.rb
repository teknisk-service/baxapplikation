class AddProductsToTeams < ActiveRecord::Migration[5.1]
  def change
  	add_column :teams, :products, :string, array: true, :default => []
  end
end
