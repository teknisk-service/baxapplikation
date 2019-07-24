class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.integer :year
      t.boolean :active
      t.string :users, array: true, default: []

      t.timestamps
    end
  end
end
