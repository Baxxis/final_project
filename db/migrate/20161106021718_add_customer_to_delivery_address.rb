class AddCustomerToDeliveryAddress < ActiveRecord::Migration[5.0]
  def change
    add_reference :delivery_addresses, :customer, foreign_key: true
  end
end
