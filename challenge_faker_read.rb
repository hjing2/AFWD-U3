require_relative 'ar.rb'
require_relative 'challenge_faker.rb'

# Delete empty categories
empty_categories = Category.left_joins(:products).where(products: { category_id: nil })
empty_categories.destroy_all

# Find all the categories in the database (including those that you added using Faker). 
categories = Category.all

# Display category names and their associated products
categories.each do |category|
  puts "Category: #{category.name}"
  
  category.products.each do |product|
    puts "\tProduct: #{product.name}, Price: #{product.price}"
  end
end

