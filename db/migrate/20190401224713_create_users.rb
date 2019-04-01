class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :ssn
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :account_type
      t.string :position
      t.string :email
      t.string :password
      t.references :address, index: true, foreign_key: true
      t.timestamps
    end
  end
end
