class AddTeamsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :teams, :integer, array:true, default:[]
  end
end
