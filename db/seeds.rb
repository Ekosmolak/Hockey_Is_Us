require 'csv'

# Create admin user if in development environment
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Method to create products from CSV
def create_products_from_csv(file_path)
  CSV.foreach(file_path, headers: true, encoding: 'iso-8859-1', quote_char: '"', col_sep: ',,') do |row|
    # Remove columns with nil or empty values (those created by ,,)
    cleaned_row = row.to_hash.reject { |key, value| value.blank? }

    brand = Brand.find_by(id: cleaned_row['brand_id'].to_i)
    category = Category.find_by(id: cleaned_row['category_id'].to_i)

    if brand && category
      product = Product.new(
        brand_id: brand.id,
        category_id: category.id,
        model: cleaned_row['model'],
        description: cleaned_row['description'],
        price: cleaned_row['price'].to_d
      )

      if product.save
        puts "Product created: #{product.model}"
      else
        puts "Failed to create product: #{product.model}. Errors: #{product.errors.full_messages.join(', ')}"
      end
    else
      puts "Invalid brand or category for product: #{cleaned_row['model']}. Brand ID: #{cleaned_row['brand_id']}, Category ID: #{cleaned_row['category_id']}"
    end
  end
end

# Create default brands
brands = [ "Bauer", "True", "CCM", "Warrior", "Sherwood" ]
brands.each { |brand| Brand.find_or_create_by(name: brand) }

# Create default categories
categories = [ "Skates", "Sticks", "Helmets", "Gloves", "Accessories" ]
categories.each { |category| Category.find_or_create_by(equipment_type: category) }

# Create products from CSV files
create_products_from_csv(Rails.root.join('db/skates.csv'))
create_products_from_csv(Rails.root.join('db/sticks.csv'))
create_products_from_csv(Rails.root.join('db/helmets.csv'))
create_products_from_csv(Rails.root.join('db/gloves.csv'))
create_products_from_csv(Rails.root.join('db/accessories.csv'))
