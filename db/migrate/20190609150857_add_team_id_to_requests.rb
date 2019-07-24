class AddTeamIdToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :team_id, :integer
  end
end
