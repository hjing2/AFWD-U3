class Product < ActiveRecord::Base
  # This AR object is linked with the products table.
  
  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a category.
  # Columns in the products table: <Product id: 155, name: "Chai", description: "10 boxes x 30 bags", price: #<BigDecimal:55b5c943a290,'0.18E2',9(18)>, stock_quantity: 39, category_id: 1, created_at: "2011-11-18 04:48:44", updated_at: "2011-11-18 04:48:44">
  # Yes, I can determine the products table has an association with the table "category" because it has the column "category_id".
  belongs_to :category

  # A validation to this class such that a product must have all columns (other than foreign keys, the id, or datetime column) filled out before it can be saved to the db.
  validates :name, :description, :price, :stock_quantity, presence: true

  # A validation that will ensure that all product names are unique and longer than 3 characters.
  validates :name, uniqueness: true, length: { minimum: 4 }


end