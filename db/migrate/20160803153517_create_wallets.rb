class CreateWallets < ActiveRecord::Migration[5.0]
  def change
    create_table :wallets do |t|
      t.integer :amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
