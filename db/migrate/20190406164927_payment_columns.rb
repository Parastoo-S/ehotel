class PaymentColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :employee_id, :integer
    add_column :payments, :customer_id, :integer
    add_column :payments, :payment_method, :string
  end
end
