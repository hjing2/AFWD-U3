require_relative 'ar.rb'

# Find the specific product to delete
earl = Product.where(:name => 'Earl Grey').first

puts earl.inspect

# Delete this product earl

earl.destroy unless earl.nil?

puts earl.inspect

