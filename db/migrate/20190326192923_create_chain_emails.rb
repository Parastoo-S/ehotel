class CreateChainEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :chain_emails do |t|
      t.string :email_address
      t.references :chain, index: true, foreign_key: true
      t.timestamps
    end
  end
end
