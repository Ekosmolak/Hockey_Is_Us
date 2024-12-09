class ReplacePasswordWithPasswordDigest < ActiveRecord::Migration[7.2]
  def change
    remove_column :customers, :password, :string
    add_column :customers, :password_digest, :string
  end
end
