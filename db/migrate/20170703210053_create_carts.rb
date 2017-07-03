class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.datetime :date
      t.boolean :payed
      t.string :mammerist

      t.timestamps
    end
  end
end
