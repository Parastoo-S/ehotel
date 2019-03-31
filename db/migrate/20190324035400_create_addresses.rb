class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :street_number
      t.string :street_name
      t.integer :apt_number
      t.string :city
      t.string :state
      t.string :zip
      t.timestamps
    end
  end
end
