class Order < ApplicationRecord
  validates :order_item_id, :customer_id, :total_price, presence: true
  validates :order_item_id, :total_price, numericality: true
  has_many :customers
  belongs_to :order_item

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "customer_id", "id", "order_item_id", "total_price", "updated_at" ]
  end
end
