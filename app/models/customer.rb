class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :name, :address, :postal_code, :province, :email, :phone_number, presence: true
  validates :email, uniqueness: true
  validates :phone_number, format: { with: /\A[+\d\s()-]*\z/, message: "only allows numbers, spaces, and dashes" }

  has_many :orders

  def self.ransackable_associations(auth_object = nil)
    [ "orders" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "address", "created_at", "email", "id", "name", "phone_number", "postal_code", "province", "updated_at", "reset_password_token" ]
  end
end
