class Customer < ApplicationRecord
  validates :name, :address, :postal_code, :province, :email, :phone_number, presence: true
  validates :phone_number, numericality: true
  validates :email, uniqueness: true
  has_many :orders
  has_secure_password

  def self.ransackable_associations(auth_object = nil)
    [ "orders" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "address", "created_at", "email", "id", "name", "province", "phone_number", "postal_code", "updated_at" ]
  end
end
