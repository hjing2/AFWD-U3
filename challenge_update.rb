require_relative 'ar.rb'

# To find out all products with a stock quantity greater than 40.
product_great_quantity = Product.where('stock_quantity > 40')

# Add one to all the stock quantities of these products

product_great_quantity.each do |product|
    product.stock_quantity += 1
    product.save

    puts "Updated products are #{product.name}, the updated quantity is #{product.stock_quantity}"
end

