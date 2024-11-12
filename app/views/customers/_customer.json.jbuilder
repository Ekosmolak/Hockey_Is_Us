json.extract! customer, :id, :name, :address, :postal_code, :phone_number, :email, :created_at, :updated_at
json.url customer_url(customer, format: :json)
