json.extract! order, :id, :order_items_id, :customer_id, :total_price, :created_at, :updated_at
json.url order_url(order, format: :json)
