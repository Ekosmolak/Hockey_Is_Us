class CreateOrderItems < ActiveRecord::Migration[7.2]
  def change
    create_table :order_items do |t|
      t.integer :product_id
      t.integer :quantity
      t.decimal :price_at_purchase
      t.decimal :subtotal

      t.timestamps
    end
  end
end
