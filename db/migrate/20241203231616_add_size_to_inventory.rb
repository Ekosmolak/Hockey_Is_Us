class AddSizeToInventory < ActiveRecord::Migration[7.2]
  def change
    add_column :inventories, :size, :string
  end
end
