class AddTeamIdToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :team_id, :integer
  end
end
