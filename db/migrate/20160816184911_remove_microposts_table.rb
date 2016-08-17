class RemoveMicropostsTable < ActiveRecord::Migration[5.0]
  def change
    if ActiveRecord::Base.connection.table_exists? :microposts
      drop_table :microposts
    end
  end
end
