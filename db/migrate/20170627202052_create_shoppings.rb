class CreateShoppings < ActiveRecord::Migration[5.0]
  def change
    create_table :shoppings do |t|
      t.integer :sum
      t.string :description
      t.string :mammerist

      t.timestamps
    end
  end
end
