class AlterColumnProductsPrice < ActiveRecord::Migration[5.0]
  def self.up
    change_table :products do |t|
      t.change :price, :decimal, :precision => 10, :scale => 2
    end
  end
  def self.down
    change_table :products do |t|
      t.change :price, :integer
    end
  end
end
