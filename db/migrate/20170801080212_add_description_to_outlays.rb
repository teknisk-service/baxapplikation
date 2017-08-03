class AddDescriptionToOutlays < ActiveRecord::Migration[5.0]
  def change
    add_column :outlays, :description, :string
  end
end
