class RemoveDescriptionFromOrderStatus < ActiveRecord::Migration[5.0]
  def change
    remove_column :order_statuses, :description, :string
  end
end
