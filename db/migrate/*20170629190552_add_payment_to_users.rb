class AddPaymentToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :payment, :integer
  end
end
