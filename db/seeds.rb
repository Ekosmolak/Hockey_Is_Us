require "csv"
# Skates description is from https://www.prohockeylife.com/collections/senior-hockey-skates
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

brands = [ "Bauer", "True", "CCM", "Warrior", "Sherwood" ]
categories = [ "Skates", "Sticks", "Helmets", "Gloves", "Accessories" ]


brands.each do |brand|
  Brand.create(
    name: brands
  )
end

categories.each do |category|
  Category.create(
    equipment_type: categories
  )
end
