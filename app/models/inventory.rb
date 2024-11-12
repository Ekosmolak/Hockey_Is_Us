class Inventory < ApplicationRecord
validates :product_id, :stock_level, numericality: true
validates :product_id, :stock_level, presence: true
  has_many :products

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "product_id", "stock_level", "updated_at" ]
  end
end
