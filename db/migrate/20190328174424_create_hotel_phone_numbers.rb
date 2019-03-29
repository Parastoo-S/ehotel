class CreateHotelPhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :hotel_phone_numbers do |t|
      t.string :phone_number
      t.references :hotel, index: true, foreign_key: true
      t.timestamps
    end
  end
end
