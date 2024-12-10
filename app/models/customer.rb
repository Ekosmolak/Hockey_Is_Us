class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  validates :name, :address, :postal_code, :province, :email, :phone_number, presence: true
  validates :phone_number, numericality: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }, if: :password_required?

  has_many :orders

  def self.ransackable_associations(auth_object = nil)
    [ "orders" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "address", "created_at", "email", "id", "name", "phone_number", "postal_code", "province", "updated_at", "reset_password_token" ]
  end
end
