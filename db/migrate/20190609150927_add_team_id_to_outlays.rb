class AddTeamIdToOutlays < ActiveRecord::Migration[5.1]
  def change
    add_column :outlays, :team_id, :integer
  end
end
