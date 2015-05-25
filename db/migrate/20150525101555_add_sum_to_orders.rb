class AddSumToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :sum, :decimal, precision: 8, scale: 2
  end
end
