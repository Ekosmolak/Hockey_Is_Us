class OrderItem < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "price_at_purchase", "product_id", "quantity", "subtotal", "updated_at" ]
  end
end
