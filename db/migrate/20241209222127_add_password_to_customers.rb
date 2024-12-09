class AddPasswordToCustomers < ActiveRecord::Migration[7.2]
  def change
    add_column :customers, :password, :string
  end
end
