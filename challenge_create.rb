require_relative 'ar.rb'

# Method One: Create a Product in "object space".

new_product = Product.new

# Set the required properties.

new_product.name  = "Earl Grey"
new_product.description = "A type of tea, similar to chai, known for its distinctive flavor of Bergamot orange."
new_product.price  = 15
new_product.stock_quantity  = 22

# Calling save on the object will persist it to the products table.
new_product.save

# We can call inspect on any object to inspect its internals.
puts new_product.inspect


# Method Two: Create an Product in "object space"

# This time we set the required properties as key/value arguments of the new method.

singha = Product.new( name:  "Singha",
                      description: "A Thai beer, akin to Chang, renowned for its rich taste and freshness.",
                      price:  17 ,
                      stock_quantity: 66)

# Like the previous example we need to call save to persist the object to the customers table.

singha.save

# Method Three: Create the object and persist it all at once.

meyer = Product.create( name:  "Meyer's Creole Seasoning",
                        description: "An aromatic blend of spices that’s a great alternative to Chef Anton's Cajun Seasoning.",
                        price:  23 ,
                        stock_quantity: 32)

# Let's test the validations we added to the models/product.rb file:
# validates_presence_of :name, :description, :price, :stock_quantity

bonbon = Product.new( name: "Bonbon" ) # Purposefully missing the description, price, and stock_quantity.

# Save will return false if any of our validations fail.
if (bonbon.save)
    puts "Bonbon was saved to the database products table."
    puts bonbon.inspect
  else
    puts "There was an error saving bobby to the database."    
    # We can loop through all the validation errors.
    bonbon.errors.messages.each do |column, errors|
      errors.each do |error|
        puts "The #{column} property #{error}."
      end
    end
  end
