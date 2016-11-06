class CreateDeliveryAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_addresses do |t|
      t.string :address
      t.string :city
      t.string :postal_code
      t.references :province, foreign_key: true

      t.timestamps
    end
  end
end
