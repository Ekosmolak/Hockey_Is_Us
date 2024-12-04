class Product < ApplicationRecord
validates :brand_id, :model, :category_id, :price, presence: true
validates :price, numericality: true
  has_many :inventories
  belongs_to :brand
  belongs_to :category
  has_many :order_items

  def self.ransackable_associations(auth_object = nil)
    [ "brand", "category", "inventories", "order_items" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "brand_id", "category_id", "created_at", "description", "id", "model", "price", "size", "updated_at" ]
  end
end
