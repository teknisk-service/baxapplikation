class AddTeamIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :team_id, :integer
  end
end
