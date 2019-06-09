class AddTeamIdToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :team_id, :integer
  end
end
