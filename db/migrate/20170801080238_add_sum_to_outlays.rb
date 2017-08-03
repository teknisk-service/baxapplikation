class AddSumToOutlays < ActiveRecord::Migration[5.0]
  def change
    add_column :outlays, :sum, :integer
  end
end
