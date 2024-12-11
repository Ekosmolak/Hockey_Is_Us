class AddProductIdToOrderItems < ActiveRecord::Migration[7.2]
  def change
    add_column :order_items, :product_id, :integer
  end
end
