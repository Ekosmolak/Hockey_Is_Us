class CreateInventories < ActiveRecord::Migration[7.2]
  def change
    create_table :inventories do |t|
      t.integer :product_id
      t.integer :stock_level

      t.timestamps
    end
  end
end
