ActiveAdmin.register Order do
  permit_params :id, :customer_id, :order_date, :ship_date, :status, :pst, :gst, :hst
end
