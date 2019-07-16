class AddPaymentsToTeams < ActiveRecord::Migration[5.1]
  def change
  	add_column :teams, :payments, :string, array: true, :default => []
  end
end
