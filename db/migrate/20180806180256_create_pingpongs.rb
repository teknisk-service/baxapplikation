class CreatePingpongs < ActiveRecord::Migration[5.1]
  def change
    create_table :pingpongs do |t|
      t.integer :winner
      t.integer :looser
      t.integer :sets_p1
      t.integer :sets_p2

      t.timestamps
    end
  end
end
