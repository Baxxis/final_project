json.extract! delivery_address, :id, :address, :city, :postal_code, :province_id, :created_at, :updated_at
json.url delivery_address_url(delivery_address, format: :json)