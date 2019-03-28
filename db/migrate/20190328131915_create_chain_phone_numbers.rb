class CreateChainPhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :chain_phone_numbers do |t|
      t.string :phone_number
      t.references :chain, index: true, foreign_key: true
      t.timestamps
    end
  end
end
