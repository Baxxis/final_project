class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :phone
      t.string :email
      t.references :province, foreign_key: true

      t.timestamps
    end
  end
end
