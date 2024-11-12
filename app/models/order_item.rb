class OrderItem < ApplicationRecord
validates :product_id, :quantity, :price_at_purchase, :subtotal, presence: true
validates :quantity, :price_at_purchase, :subtotal, numericality: true
  belongs_to :order
  has_many :products

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "price_at_purchase", "product_id", "quantity", "subtotal", "updated_at" ]
  end
end
