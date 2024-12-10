# frozen_string_literal: true

class AddDeviseToCustomers < ActiveRecord::Migration[7.2]
  def self.up
    change_table :customers do |t|
      # Only add the 'email' column if it doesn't already exist
      unless column_exists?(:customers, :email)
        t.string :email, null: false, default: ""
      end

      # Add the 'encrypted_password' column
      t.string :encrypted_password, null: false, default: ""

      # Recoverable fields
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      # Rememberable fields
      t.datetime :remember_created_at
    end

    # Add the necessary indexes
    add_index :customers, :email, unique: true unless index_exists?(:customers, :email)
    add_index :customers, :reset_password_token, unique: true unless index_exists?(:customers, :reset_password_token)
  end

  def self.down
    # To roll back the migration, remove the Devise columns
    change_table :customers do |t|
      t.remove :email
      t.remove :encrypted_password
      t.remove :reset_password_token
      t.remove :reset_password_sent_at
      t.remove :remember_created_at
    end

    remove_index :customers, :email
    remove_index :customers, :reset_password_token
  end
end
