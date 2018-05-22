class ChangeCommentsToRequests < ActiveRecord::Migration[5.1]
  def change
    rename_table :comments, :requests
  end
end
