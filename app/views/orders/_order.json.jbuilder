json.extract! order, :id, :order_date, :ship_date, :pst, :gst, :hst, :customer_id, :order_status_id, :created_at, :updated_at
json.url order_url(order, format: :json)