require 'csv'
require 'open-uri'

Product.delete_all
Brand.delete_all
Category.delete_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

def create_products_from_csv(file_path)
  CSV.foreach(file_path, headers: true, encoding: 'iso-8859-1', quote_char: '"', col_sep: ',,') do |row|
    cleaned_row = row.to_hash.reject { |key, value| value.blank? }

    brand = Brand.find_by(id: cleaned_row['brand_id'].to_i)
    category = Category.find_by(id: cleaned_row['category_id'].to_i)

    if brand && category
      product = Product.new(
        brand_id: brand.id,
        category_id: category.id,
        model: cleaned_row['model'],
        # description: cleaned_row['description'], bring back description on product.html.erb
        price: cleaned_row['price'].to_d
      )

      if cleaned_row['image'].present?
        begin
          image_file = URI.open(cleaned_row['image'])
          product.image.attach(io: image_file, filename: File.basename(image_file.path))
        rescue OpenURI::HTTPError => e
          puts "Failed to attach image for #{product.model}: #{e.message}"
        end
      end

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


brands = [ "Bauer", "True", "CCM", "Warrior", "Sherwood" ]
brands.each { |brand| Brand.find_or_create_by(name: brand) }

categories = [ "Skates", "Sticks", "Helmets", "Gloves", "Accessories" ]
categories.each { |category| Category.find_or_create_by(equipment_type: category) }

create_products_from_csv(Rails.root.join('db/skates.csv'))
create_products_from_csv(Rails.root.join('db/sticks.csv'))
create_products_from_csv(Rails.root.join('db/helmets.csv'))
create_products_from_csv(Rails.root.join('db/gloves.csv'))
create_products_from_csv(Rails.root.join('db/accessories.csv'))
