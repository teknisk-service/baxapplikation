class CreateWhitelists < ActiveRecord::Migration[5.0]
  def change
    create_table :whitelists do |t|
      t.string :email

      t.timestamps
    end
  end
end
