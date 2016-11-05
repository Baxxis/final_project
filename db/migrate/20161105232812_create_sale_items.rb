class CreateSaleItems < ActiveRecord::Migration[5.0]
  def change
    create_table :sale_items do |t|
      t.decimal :percent_discount
      t.datetime :begin_date
      t.datetime :end_date
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
