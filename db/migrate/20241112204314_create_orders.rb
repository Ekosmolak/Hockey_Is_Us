class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.integer :order_items_id
      t.integer :customer_id
      t.decimal :total_price

      t.timestamps
    end
  end
end
