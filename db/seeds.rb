require "csv"
# Skates description is from https://www.prohockeylife.com/collections/senior-hockey-skates
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

brands = [ "Bauer", "True", "CCM", "Warrior", "Sherwood" ]
categories = [ "Skates", "Sticks", "Helmets", "Gloves", "Accessories" ]


brands.each do |brand|
  Brand.create(
    name: brand
  )
end

categories.each do |category|
  Category.create(
    equipment_type: category
  )
end

skates_file = Rails.root.join('db/skates.csv')
skates_data = File.read(skates_file)
skates = CSV.parse(skates_data, headers: true, encoding: 'iso-8859-1')

skates.each do |skate|
  Product.create(
    brand_id: skate['brand_id'],
    model: skate['model'],
    category_id: skate['category_id'],
    description: skate['description'],
    price: skate['price']
  )
end

sticks_file = Rails.root.join('db/sticks.csv')
sticks_data = File.read(sticks_file)
sticks = CSV.parse(sticks_data, headers: true, encoding: 'iso-8859-1')

sticks.each do |stick|
  Product.create(
    brand_id: stick['brand_id'],
    model: stick['model'],
    category_id: stick['category_id'],
    description: stick['description'],
    price: stick['price']
  )
end

helmets_file = Rails.root.join('db/helmets.csv')
helmets_data = File.read(helmets_file)
helmets = CSV.parse(helmets_data, headers: true, encoding: 'iso-8859-1')

helmets.each do |helmet|
  Product.create(
    brand_id: helmet['brand_id'],
    model: helmet['model'],
    category_id: helmet['category_id'],
    description: helmet['description'],
    price: helmet['price']
  )
end

gloves_file = Rails.root.join('db/gloves.csv')
gloves_data = File.read(gloves_file)
gloves = CSV.parse(gloves_data, headers: true, encoding: 'iso-8859-1')

gloves.each do |glove|
  Product.create(
    brand_id: glove['brand_id'],
    model: glove['model'],
    category_id: glove['category_id'],
    description: glove['description'],
    price: glove['price']
  )
end

accessories_file = Rails.root.join('db/accessories.csv')
accessories_data = File.read(accessories_file)
accessories = CSV.parse(accessories_data, headers: true, encoding: 'iso-8859-1')

accessories.each do |accessory|
  Product.create(
    brand_id: accessory['brand_id'],
    model: accessory['model'],
    category_id: accessory['category_id'],
    price: accessory['price']
  )
end

rand(5..20).times do
  Inventory
end
