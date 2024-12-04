require 'csv'
require 'open-uri'

[ Product, Brand, Category ].each(&:delete_all)

brands = {
  1 => "Bauer",
  2 => "True",
  3 => "CCM",
  4 => "Warrior",
  5 => "Sherwood"
}

categories = {
  1 => "Skates",
  2 => "Sticks",
  3 => "Helmets",
  4 => "Gloves",
  5 => "Accessories"
}

brands.each { |id, name| Brand.find_or_create_by(id: id, name: name) }
categories.each { |id, type| Category.find_or_create_by(id: id, equipment_type: type) }

def create_products_from_csv(file_path)
  CSV.foreach(file_path, headers: true, encoding: 'iso-8859-1', quote_char: '"', col_sep: ',,') do |row|
    product_params = row.to_hash.symbolize_keys.slice(:brand_id, :model, :category_id, :price, :image, :description)
    product = Product.find_or_initialize_by(
      brand_id: product_params[:brand_id],
      model: product_params[:model],
      category_id: product_params[:category_id],
      description: product_params[:description]
    )
    product.price = product_params[:price].to_d

    if product_params[:image].present? && !product.image.attached?
      attach_image(product, product_params[:image])
    end

    if product.save
      puts "Product created: #{product.model}"
    else
      puts "Failed to create product: #{product.model}. Errors: #{product.errors.full_messages.join(', ')}"
    end
  end
end

def attach_image(product, image_url)
  begin
    image_file = URI.open(image_url)
    product.image.attach(io: image_file, filename: File.basename(image_file.path))
    puts "Image attached for #{product.model}"
  rescue OpenURI::HTTPError => e
    puts "Failed to attach image for #{product.model}: #{e.message}"
  end
end

AdminUser.find_or_create_by!(email: 'admin@example.com') do |admin|
  admin.password = 'password'
  admin.password_confirmation = 'password'
end


%w[skates sticks helmets gloves accessories].each do |file|
  create_products_from_csv(Rails.root.join("db/#{file}.csv"))
end


Product.find_each do |product|
  rand(10..25).times do
    size = case product.category_id
    when 1
             rand(6..13)
    when 3, 4
             [ 'S', 'M', 'L', 'XL' ].sample
             [ 'Left', 'Right' ].sample
    else
             'One Size'
    end

    Inventory.create!(
      product_id: product.id,
      stock_level: rand(5..25),
      size: size
    )
  end
end
