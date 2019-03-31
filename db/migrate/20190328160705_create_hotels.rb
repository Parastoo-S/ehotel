class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.integer :num_of_rooms
      t.integer :rating
      t.references :chain, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true
      t.timestamps
    end
  end
end
