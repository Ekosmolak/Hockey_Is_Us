class RemoveDescriptionFromCategory < ActiveRecord::Migration[7.2]
  def change
    remove_column :categories, :description, :string
  end
end
