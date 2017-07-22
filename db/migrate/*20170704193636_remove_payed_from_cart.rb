class RemovePayedFromCart < ActiveRecord::Migration[5.0]
  def change
    remove_column :carts, :payed, :boolean
  end
end
