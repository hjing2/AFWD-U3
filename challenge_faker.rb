require_relative 'ar.rb'

# Create 10 categories and 10 products for each category
10.times do
  category = Category.create(name: Faker::Food.ingredient)

  if category.persisted?
    10.times do
      Product.create(
        name: Faker::Food.dish,
        description: Faker::Lorem.paragraph,
        price: Faker::Commerce.price,
        stock_quantity: Faker::Number.between(1, 20),
        category: category
      )
    end
  else
    puts "Error in creating categories."
  end
end
