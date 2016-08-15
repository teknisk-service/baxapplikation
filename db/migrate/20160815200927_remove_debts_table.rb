class RemoveDebtsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :debts
  end
end
