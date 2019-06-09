class AddTeamIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :team_id, :integer
  end
end
