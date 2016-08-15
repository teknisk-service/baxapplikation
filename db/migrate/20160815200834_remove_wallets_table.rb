class RemoveWalletsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :wallets
  end
end
