class RemoveLineItemsTable < ActiveRecord::Migration[5.0]
  def change
    if ActiveRecord::Base.connection.table_exists? :line_items
      drop_table :line_items
    end
  end
end
