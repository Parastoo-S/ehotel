class AddEmailColumnToHotel < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :email_address, :string
  end
end
