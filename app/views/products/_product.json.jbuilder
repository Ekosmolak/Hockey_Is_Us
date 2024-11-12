json.extract! product, :id, :brand_id, :model, :category_id, :description, :size, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
