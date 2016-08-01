class CreateDebts < ActiveRecord::Migration[5.0]
  def change
    create_table :debts do |t|
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
