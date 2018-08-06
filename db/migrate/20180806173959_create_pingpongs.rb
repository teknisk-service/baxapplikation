class CreatePingpongs < ActiveRecord::Migration[5.1]
  def change
    create_table :pingpongs do |t|

      t.timestamps
    end
  end
end
