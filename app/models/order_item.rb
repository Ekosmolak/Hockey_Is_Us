class OrderItem < ApplicationRecord
  validates :quantity, :product_id, :price_at_purchase, :subtotal, presence: true
  validates :quantity, :product_id, :price_at_purchase, :subtotal, numericality: true
  has_many :orders
  belongs_to :product

  def self.ransackable_associations(auth_object = nil)
    [ "orders" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "product_id" "price_at_purchase", "quantity", "subtotal", "updated_at" ]
  end
end
