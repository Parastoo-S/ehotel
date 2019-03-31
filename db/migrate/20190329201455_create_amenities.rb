class CreateAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :amenities do |t|
      t.string :amenity_name
      t.references :room, index: true, foreign_key: true
      t.timestamps
    end
  end
end
