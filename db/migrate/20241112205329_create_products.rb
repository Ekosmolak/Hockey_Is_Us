class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.integer :brand_id
      t.string :model
      t.integer :category_id
      t.string :description
      t.string :size
      t.decimal :price

      t.timestamps
    end
  end
end
