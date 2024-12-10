class Product < ApplicationRecord
  validates :brand_id, :model, :category_id, :description, :price, presence: true
  validates :price, numericality: true

  has_many :inventories
  belongs_to :brand
  belongs_to :category
  has_one_attached :image

  def self.ransackable_associations(auth_object = nil)
    [ "brand", "category", "inventories", "order_items" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    super + [ "image" ]
  end
end
