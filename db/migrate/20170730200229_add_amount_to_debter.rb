class AddAmountToDebter < ActiveRecord::Migration[5.0]
  def change
    add_column :debters, :amount, :integer
  end
end
