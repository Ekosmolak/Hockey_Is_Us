require 'csv'


# Descriptions are from https://www.prohockeylife.com

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

def create_products_from_csv(file_path)
  CSV.foreach(file_path, headers: true, encoding: 'iso-8859-1') do |row|
    brand = Brand.find_by(id: row['brand_id'].to_i)
    category = Category.find_by(id: row['category_id'].to_i)

    if brand && category
      product = Product.new(
        brand_id: brand.id,
        category_id: category.id,
        model: row['model'],
        # description: row['description'], add description back in product.html.erb
        price: row['price'].to_f
      )

      if product.save
        puts "Product created: #{product.model}"
      else
        puts "Failed to create product: #{product.model}. Errors: #{product.errors.full_messages.join(', ')}"
      end
    else
      puts "Invalid brand or category for product: #{row['model']}. Brand ID: #{row['brand_id']}, Category ID: #{row['category_id']}"
    end
  end
end

brands = [ "Bauer", "True", "CCM", "Warrior", "Sherwood" ]
brands.each { |brand| Brand.find_or_create_by(name: brand) }

categories = [ "Skates", "Sticks", "Helmets", "Gloves", "Accessories" ]
categories.each { |category| Category.find_or_create_by(equipment_type: category) }

create_products_from_csv(Rails.root.join('db/skates.csv'))
create_products_from_csv(Rails.root.join('db/sticks.csv'))
create_products_from_csv(Rails.root.join('db/helmets.csv'))
create_products_from_csv(Rails.root.join('db/gloves.csv'))
create_products_from_csv(Rails.root.join('db/accessories.csv'))
