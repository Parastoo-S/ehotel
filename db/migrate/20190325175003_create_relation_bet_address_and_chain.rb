class CreateRelationBetAddressAndChain < ActiveRecord::Migration[5.1]
  def change
    add_reference :chains, :address, index: true, foreign_key: true
  end
end
