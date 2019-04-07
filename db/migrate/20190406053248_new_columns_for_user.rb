class NewColumnsForUser < ActiveRecord::Migration[5.1]
  def change
add_column :users, :ssn, :string
add_column :users, :position, :string
add_column :users, :account_type, :string
add_column :users, :middle_name, :string
add_column :users, :last_name, :string
add_column :users, :address, :string

  end
end
