class Category < ApplicationRecord
  validates :equipment_type, presence: true
  has_many :products

  def self.ransackable_associations(auth_object = nil)
    [ "products" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "description", "equipment_type", "id", "updated_at" ]
  end
end
