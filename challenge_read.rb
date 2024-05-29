require_relative 'ar.rb'

number_of_products = Product.count

puts "There are #{number_of_products} in the products table."

product1 = Product.first
puts "Inspect the first product: "
puts product1.inspect

# To find out the names of all products above $10 with names that begin with the letter C.

product_C = Product.where('name LIKE ? AND price > ?', 'C%', 10).pluck(:name)

puts "Product names starting with C and price over $10 are: #{product_C.join(', ')}"

# Find out total number of products with a low stock quantity.

product_low = Product.where('stock_quantity < 5').count

puts "Total number of low stock products are: #{product_low}"

# Find the name of the category associated with the first product
puts "The category name of the first product is: #{product1.category.name}"

# Display all the category names
categories = Category.pluck(:name)
puts "All category names are: #{categories.join(', ')}"

# Find a specific category and use it to build and persist a new product associated with this category
specific_category = Category.find_by(name: "Seafood") 
new_product = specific_category.products.create(name: "Salmon", price: 22, description: "Salmon", stock_quantity: 50)
puts "The new product under the Seafood category is: #{new_product.name}"

# Find a specific category and then use it to locate all the associated products over a certain price
specific_category2 = Category.find_by(name: "Produce") 
high_price_products = specific_category2.products.where('price > ?', 20).pluck(:name)
puts "High price products in the Produce category are: #{high_price_products.join(', ')}"