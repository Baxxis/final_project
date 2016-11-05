json.extract! sale_item, :id, :percent_discount, :begin_date, :end_date, :product_id, :created_at, :updated_at
json.url sale_item_url(sale_item, format: :json)