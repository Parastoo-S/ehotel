class CreateDamages < ActiveRecord::Migration[5.1]
  def change
    create_table :damages do |t|
      t.string :damage_name
      t.references :room, index: true, foreign_key: true
      t.timestamps
    end
  end
end
