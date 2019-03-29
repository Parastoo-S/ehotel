class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.float :price
      t.integer :capacity
      t.boolean :extendible
      t.boolean :occupied
      t.string :status
      t.string :view
      t.references :hotel, index: true, foreign_key: true
      t.timestamps
    end
  end
end
