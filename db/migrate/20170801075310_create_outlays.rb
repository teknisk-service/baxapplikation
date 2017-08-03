class CreateOutlays < ActiveRecord::Migration[5.0]
  def change
    create_table :outlays do |t|

      t.timestamps
    end
  end
end
