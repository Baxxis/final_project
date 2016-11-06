class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.datetime :ship_date
      t.decimal :pst
      t.decimal :gst
      t.decimal :hst
      t.references :customer, foreign_key: true
      t.references :order_status, foreign_key: true

      t.timestamps
    end
  end
end
