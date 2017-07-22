class AddOrderIdToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :order_id, :integer
  end
end
