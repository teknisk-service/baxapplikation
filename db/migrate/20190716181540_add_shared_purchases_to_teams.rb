class AddSharedPurchasesToTeams < ActiveRecord::Migration[5.1]
  def change
  	add_column :teams, :shared_purchases, :string, array: true, :default => []
  end
end
