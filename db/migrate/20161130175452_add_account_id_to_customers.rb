class AddAccountIdToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_reference :customers, :account, foreign_key: true
  end
end
