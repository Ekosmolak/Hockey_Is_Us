json.extract! order_item, :id, :product_id, :quantity, :price_at_purchase, :subtotal, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
