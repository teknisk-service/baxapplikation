class AddTeamIdToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :team_id, :integer
  end
end
