class UserReferences < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :employee_id, :integer
    add_reference :bookings, :user, index: true, foreign_key: true
    add_column :hotels, :manager_id, :integer
  end
end
