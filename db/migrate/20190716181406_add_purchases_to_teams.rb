class AddPurchasesToTeams < ActiveRecord::Migration[5.1]
  def change
  	add_column :teams, :purchases, :string, array: true, :default => []
  end
end
