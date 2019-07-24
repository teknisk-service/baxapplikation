class AddTeamsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :teams, :string, array: true, :default => []
  end
end
