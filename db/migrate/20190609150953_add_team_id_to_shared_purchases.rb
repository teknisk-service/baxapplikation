class AddTeamIdToSharedPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :shared_purchases, :team_id, :integer
  end
end
