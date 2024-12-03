class RemoveSizeFromProduct < ActiveRecord::Migration[7.2]
  def change
    remove_column :products, :size, :string
  end
end
