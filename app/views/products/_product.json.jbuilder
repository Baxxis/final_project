json.extract! product, :id, :name, :description, :price, :quantity, :category_id, :is_active, :created_at, :updated_at
json.url product_url(product, format: :json)