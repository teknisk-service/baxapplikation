class AddPayedToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :payed, :boolean
  end
end
