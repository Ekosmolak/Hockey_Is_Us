class Customer < ApplicationRecord
  validates :name, :address, :postal_code, :email, :phone_number, presence: true
  validates :phone_number, numericality: true
  has_many :orders

  def self.ransackable_attributes(auth_object = nil)
    [ "address", "created_at", "email", "id", "name", "phone_number", "postal_code", "updated_at" ]
  end
end
