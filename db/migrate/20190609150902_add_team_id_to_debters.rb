class AddTeamIdToDebters < ActiveRecord::Migration[5.1]
  def change
    add_column :debters, :team_id, :integer
  end
end
