json.extract! inventory, :id, :product_id, :stock_level, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
