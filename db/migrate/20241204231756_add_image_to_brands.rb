class AddImageToBrands < ActiveRecord::Migration[7.2]
  def change
    add_column :brands, :image, :string
  end
end
