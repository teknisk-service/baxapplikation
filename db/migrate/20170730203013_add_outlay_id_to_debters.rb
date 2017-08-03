class AddOutlayIdToDebters < ActiveRecord::Migration[5.0]
  def change
    add_column :debters, :outlay_id, :integer
  end
end
