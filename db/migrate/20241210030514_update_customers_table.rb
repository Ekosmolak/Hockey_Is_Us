class UpdateCustomersTable < ActiveRecord::Migration[7.2]
  def change
    remove_column :customers, :password_digest, :string
    change_column :customers, :phone_number, :string
  end
end
